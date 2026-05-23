import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item_pedido_model.dart';
import '../models/produto_model.dart';
import '../models/produto_opcao_model.dart';

import '../providers/carrinho_provider.dart';

class ProductDetailsPage extends StatefulWidget {

  final ProdutoModel produto;

  const ProductDetailsPage({
    super.key,
    required this.produto,
  });

  @override
  State<ProductDetailsPage> createState() =>
      _ProductDetailsPageState();
}

class _ProductDetailsPageState
    extends State<ProductDetailsPage> {

  int quantidade = 1;

  final Map<String, String>
      opcoesSelecionadas = {};

  Map<String, List<ProdutoOpcaoModel>>
      opcoesAgrupadas = {};

  @override
  void initState() {

    super.initState();

    for (var opcao
        in widget.produto.opcoes) {

      if (!opcoesAgrupadas.containsKey(
        opcao.grupo,
      )) {

        opcoesAgrupadas[
            opcao.grupo] = [];
      }

      opcoesAgrupadas[
          opcao.grupo]!.add(opcao);
    }

    opcoesAgrupadas.forEach(

      (grupo, listaOpcoes) {

        opcoesSelecionadas[grupo] =
            listaOpcoes.first.nome;
      },
    );
  }

  double calcularTotal() {

    double total =
        widget.produto.precoBase;

    for (var grupo
        in opcoesAgrupadas.entries) {

      for (var opcao
          in grupo.value) {

        if (opcoesSelecionadas[
                grupo.key] ==
            opcao.nome) {

          total +=
              opcao.valorAdicional;
        }
      }
    }

    return total * quantidade;
  }

  String pegarImagemProduto() {

    if (widget.produto.nome ==
        "Cartões de Visita") {

      return "assets/cartao1.png";
    }

    if (widget.produto.nome ==
        "Panfletos") {

      return "assets/panfletos.jpg";
    }

    if (widget.produto.nome ==
        "Pastas Personalizadas") {

      return "assets/pasta.jpg";
    }

    if (widget.produto.nome ==
        "Cartazes") {

      return "assets/cartaz.jpeg";
    }

    if (widget.produto.nome ==
        "Folders") {

      return "assets/folder.jpg";
    }

    if (widget.produto.nome ==
        "Etiquetas Adesivas") {

      return "assets/etiqueta.jpeg";
    }

    if (widget.produto.nome ==
        "Receituário Médico") {

      return "assets/receituario.jpeg";
    }

    return "assets/default.png";
  }

  @override
  Widget build(BuildContext context) {

    final carrinhoProvider =
        Provider.of<CarrinhoProvider>(

      context,

      listen: false,
    );

    double total = calcularTotal();

    return Scaffold(

      backgroundColor:
          const Color(0xFFF7F6F2),

      body: Column(

        children: [

          Expanded(

            child: SingleChildScrollView(

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

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

                          pegarImagemProduto(),

                          fit: BoxFit.cover,
                        ),
                      ),

                      SafeArea(

                        child: Padding(

                          padding:
                              const EdgeInsets.all(
                            16,
                          ),

                          child: GestureDetector(

                            onTap: () {

                              Navigator.pop(
                                context,
                              );
                            },

                            child: Container(

                              width: 42,
                              height: 42,

                              decoration:
                                  BoxDecoration(

                                color:
                                    Colors.white,

                                borderRadius:
                                    BorderRadius.circular(
                                  14,
                                ),
                              ),

                              child: const Icon(
                                Icons.arrow_back,
                              ),
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

                    padding:
                        const EdgeInsets.all(
                      24,
                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        Text(

                          widget.produto.nome,

                          style:
                              const TextStyle(

                            fontSize: 30,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Text(

                          "R\$ ${total.toStringAsFixed(2).replaceAll(".", ",")}",

                          style:
                              const TextStyle(

                            fontSize: 28,

                            fontWeight:
                                FontWeight.bold,

                            color: Color(
                              0xFF0B4D2B,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Text(

                          widget.produto
                              .descricao,

                          style:
                              const TextStyle(

                            fontSize: 16,

                            color:
                                Colors.black54,

                            height: 1.5,
                          ),
                        ),

                        const SizedBox(
                          height: 32,
                        ),

                        // ======================================
                        // OPÇÕES
                        // ======================================

                        ...opcoesAgrupadas.entries.map(

                          (entry) {

                            return Column(

                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [

                                Text(

                                  entry.key,

                                  style:
                                      const TextStyle(

                                    fontSize: 18,

                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),

                                const SizedBox(
                                  height: 14,
                                ),

                                Wrap(

                                  spacing: 10,
                                  runSpacing: 10,

                                  children:

                                      entry.value.map(

                                    (opcao) {

                                      bool ativo =

                                          opcoesSelecionadas[
                                                  entry.key] ==

                                              opcao.nome;

                                      return GestureDetector(

                                        onTap: () {

                                          setState(() {

                                            opcoesSelecionadas[
                                                    entry.key] =

                                                opcao.nome;
                                          });
                                        },

                                        child:
                                            Container(

                                          padding:
                                              const EdgeInsets.symmetric(

                                            horizontal:
                                                18,

                                            vertical:
                                                12,
                                          ),

                                          decoration:
                                              BoxDecoration(

                                            color:
                                                ativo

                                                    ? const Color(
                                                        0xFF0B4D2B,
                                                      )

                                                    : Colors.white,

                                            borderRadius:
                                                BorderRadius.circular(
                                              30,
                                            ),

                                            border:
                                                Border.all(

                                              color:
                                                  ativo

                                                      ? const Color(
                                                          0xFF0B4D2B,
                                                        )

                                                      : Colors.grey.shade300,
                                            ),
                                          ),

                                          child:
                                              Text(

                                            opcao.nome,

                                            style:
                                                TextStyle(

                                              color:
                                                  ativo

                                                      ? Colors.white

                                                      : Colors.black,

                                              fontWeight:
                                                  FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),

                                const SizedBox(
                                  height: 28,
                                ),
                              ],
                            );
                          },
                        ),

                        // ======================================
                        // QUANTIDADE
                        // ======================================

                        const Text(

                          "Quantidade",

                          style: TextStyle(
                            fontSize: 18,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 14,
                        ),

                        Container(

                          padding:
                              const EdgeInsets.symmetric(

                            horizontal: 8,
                            vertical: 8,
                          ),

                          decoration:
                              BoxDecoration(

                            color: Colors.white,

                            borderRadius:
                                BorderRadius.circular(
                              40,
                            ),
                          ),

                          child: Row(

                            mainAxisSize:
                                MainAxisSize.min,

                            children: [

                              _botaoQuantidade(

                                Icons.remove,

                                () {

                                  if (quantidade >
                                      1) {

                                    setState(() {

                                      quantidade--;
                                    });
                                  }
                                },
                              ),

                              Padding(

                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),

                                child: Text(

                                  quantidade
                                      .toString(),

                                  style:
                                      const TextStyle(

                                    fontSize: 22,

                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ),

                              _botaoQuantidade(

                                Icons.add,

                                () {

                                  setState(() {

                                    quantidade++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 140,
                        ),
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

            padding:
                const EdgeInsets.all(20),

            decoration:
                const BoxDecoration(
              color: Colors.white,
            ),

            child: SizedBox(

              width: double.infinity,
              height: 58,

              child: ElevatedButton(

                onPressed: () {

                  carrinhoProvider
                      .adicionarItem(

                    ItemPedidoModel(

                      produtoId:
                          widget.produto.id,

                      quantidade:
                          quantidade,

                      valorUnitario:
                          total / quantidade,

                      subtotal:
                          total,

                      observacoes:
                          opcoesSelecionadas
                              .toString(),
                    ),
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    SnackBar(

                      content: Text(

                        "${widget.produto.nome} adicionado ao carrinho",
                      ),
                    ),
                  );
                },

                style:
                    ElevatedButton.styleFrom(

                  backgroundColor:
                      const Color(
                    0xFF0B4D2B,
                  ),

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                ),

                child: const Text(

                  "Adicionar ao carrinho",

                  style: TextStyle(

                    fontSize: 18,

                    fontWeight:
                        FontWeight.bold,

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

  Widget _botaoQuantidade(
    IconData icon,
    VoidCallback onTap,
  ) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        width: 42,
        height: 42,

        decoration: BoxDecoration(

          color: Colors.grey.shade100,

          borderRadius:
              BorderRadius.circular(
            30,
          ),
        ),

        child: Icon(icon),
      ),
    );
  }
}