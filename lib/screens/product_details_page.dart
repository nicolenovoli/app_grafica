import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item_pedido_model.dart';
import '../models/produto_model.dart';
import '../models/produto_opcao_model.dart';

import '../providers/carrinho_provider.dart';
import '../providers/product_details_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProdutoModel produto;

  const ProductDetailsPage({super.key, required this.produto});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<ProductDetailsProvider>(
        context,
        listen: false,
      ).inicializar(widget.produto);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<ProductDetailsProvider>(context);

    final carrinhoProvider = Provider.of<CarrinhoProvider>(
      context,
      listen: false,
    );

    double valorUnitario = detailsProvider.calcularValorUnitario(
      widget.produto,
    );

    double total = detailsProvider.calcularTotal(widget.produto);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // ======================================
                  // IMAGEM
                  // ======================================
                  Stack(
                    children: [
                      Container(
                        height: 360,
                        width: double.infinity,

                        color: Colors.white,

                        child: Image.asset(
                          "assets/${widget.produto.imagem}",

                          fit: BoxFit.cover,

                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,

                              child: const Center(
                                child: Icon(
                                  Icons.image,

                                  size: 80,

                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16),

                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },

                            child: Container(
                              width: 42,
                              height: 42,

                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(14),
                              ),

                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ======================================
                  // CONTEÚDO
                  // ======================================
                  Padding(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          widget.produto.nome,

                          style: const TextStyle(
                            fontSize: 30,

                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "R\$ ${total.toStringAsFixed(2).replaceAll(".", ",")}",

                          style: const TextStyle(
                            fontSize: 28,

                            fontWeight: FontWeight.bold,

                            color: Color(0xFF0B4D2B),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          widget.produto.descricao,

                          style: const TextStyle(
                            fontSize: 16,

                            color: Colors.black54,

                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // ======================================
                        // OPÇÕES
                        // ======================================
                        ...detailsProvider.opcoesAgrupadas.entries.map((entry) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                entry.key,

                                style: const TextStyle(
                                  fontSize: 18,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 14),

                              Wrap(
                                spacing: 10,
                                runSpacing: 10,

                                children: entry.value.map((
                                  ProdutoOpcaoModel opcao,
                                ) {
                                  bool ativo =
                                      detailsProvider.opcoesSelecionadas[entry
                                          .key] ==
                                      opcao.nome;

                                  return GestureDetector(
                                    onTap: () {
                                      detailsProvider.selecionarOpcao(
                                        grupo: entry.key,

                                        nomeOpcao: opcao.nome,
                                      );
                                    },

                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,

                                        vertical: 12,
                                      ),

                                      decoration: BoxDecoration(
                                        color: ativo
                                            ? const Color(0xFF0B4D2B)
                                            : Colors.white,

                                        borderRadius: BorderRadius.circular(30),

                                        border: Border.all(
                                          color: ativo
                                              ? const Color(0xFF0B4D2B)
                                              : Colors.grey.shade300,
                                        ),
                                      ),

                                      child: Text(
                                        opcao.nome,

                                        style: TextStyle(
                                          color: ativo
                                              ? Colors.white
                                              : Colors.black,

                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),

                              const SizedBox(height: 28),
                            ],
                          );
                        }),

                        // ======================================
                        // QUANTIDADE
                        // ======================================
                        const Text(
                          "Quantidade",

                          style: TextStyle(
                            fontSize: 18,

                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(40),
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              _botaoQuantidade(Icons.remove, () {
                                detailsProvider.diminuirQuantidade();
                              }),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),

                                child: Text(
                                  detailsProvider.quantidade.toString(),

                                  style: const TextStyle(
                                    fontSize: 22,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              _botaoQuantidade(Icons.add, () {
                                detailsProvider.aumentarQuantidade();
                              }),
                            ],
                          ),
                        ),

                        const SizedBox(height: 140),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ======================================
          // BOTÃO
          // ======================================
          Container(
            padding: const EdgeInsets.all(20),

            decoration: const BoxDecoration(color: Colors.white),

            child: SizedBox(
              width: double.infinity,
              height: 58,

              child: ElevatedButton(
                onPressed: () {
                  carrinhoProvider.adicionarItem(
                    ItemPedidoModel(
                      produtoId: widget.produto.id,

                      nome: widget.produto.nome,

                      imagem: widget.produto.imagem,

                      quantidade: detailsProvider.quantidade,

                      valorUnitario: valorUnitario,

                      subtotal: total,

                      observacoes: detailsProvider.opcoesSelecionadas.entries
                          .map((e) => "${e.key}: ${e.value}")
                          .join(" | "),
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,

                      backgroundColor: Colors.white,

                      elevation: 8,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),

                      content: Row(
                        children: [
                          const CircleAvatar(
                            radius: 14,

                            backgroundColor: Color(0xFF0B4D2B),

                            child: Icon(
                              Icons.check,

                              color: Colors.white,

                              size: 16,
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              mainAxisSize: MainAxisSize.min,

                              children: [
                                const Text(
                                  "Adicionado ao carrinho!",

                                  style: TextStyle(
                                    color: Colors.black,

                                    fontWeight: FontWeight.bold,

                                    fontSize: 15,
                                  ),
                                ),

                                const SizedBox(height: 2),

                                Text(
                                  "${detailsProvider.quantidade} x ${widget.produto.nome}",

                                  style: const TextStyle(
                                    color: Colors.black54,

                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      duration: const Duration(seconds: 2),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B4D2B),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                child: const Text(
                  "Adicionar ao carrinho",

                  style: TextStyle(
                    fontSize: 18,

                    fontWeight: FontWeight.bold,

                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoQuantidade(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 42,
        height: 42,

        decoration: BoxDecoration(
          color: Colors.grey.shade100,

          borderRadius: BorderRadius.circular(30),
        ),

        child: Icon(icon),
      ),
    );
  }
}
