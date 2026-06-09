import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/pedido_model.dart';

import '../providers/carrinho_provider.dart';
import '../providers/cliente_provider.dart';
import '../providers/pedido_provider.dart';

import 'cliente_page.dart';
import 'first_page.dart';

class ResumoPedidoPage extends StatelessWidget {
  const ResumoPedidoPage({super.key});

  static const String chavePix = "pix@graficapergaminho.com.br";

  @override
  Widget build(BuildContext context) {
    final carrinhoProvider = Provider.of<CarrinhoProvider>(context);

    final clienteProvider = Provider.of<ClienteProvider>(context);

    final pedidoProvider = Provider.of<PedidoProvider>(context);

    final cliente = clienteProvider.cliente;

    if (cliente == null) {
      return const Scaffold(
        body: Center(child: Text("Cliente não encontrado")),
      );
    }

    return Scaffold(
      

      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 0,

        title: const Text(
          "Resumo do Pedido",
          style: TextStyle(
            color: Color(0xFF0B4D2B),
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(color: Color(0xFF0B4D2B)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ==========================
                // PRODUTOS
                // ==========================
                Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        "Resumo do pedido",

                        style: TextStyle(
                          fontSize: 22,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      ...carrinhoProvider.itens.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),

                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      "${item.quantidade}x ${item.nomeProduto}",
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      item.observacoes,

                                      style: const TextStyle(
                                        fontSize: 12,

                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Text(
                                "R\$ ${item.subtotal.toStringAsFixed(2).replaceAll(".", ",")}",
                              ),
                            ],
                          ),
                        );
                      }),

                      const Divider(),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text(
                            "TOTAL",

                            style: TextStyle(
                              fontSize: 20,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "R\$ ${carrinhoProvider.total.toStringAsFixed(2).replaceAll(".", ",")}",

                            style: const TextStyle(
                              fontSize: 24,

                              fontWeight: FontWeight.bold,

                              color: Color(0xFF0B4D2B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ==========================
                // CLIENTE
                // ==========================
                Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text(
                            "Dados do cliente",

                            style: TextStyle(
                              fontSize: 20,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) => const ClientePage(),
                                ),
                              );
                            },

                            icon: const Icon(Icons.edit),

                            label: const Text("Editar"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Text(cliente.nome),

                      const SizedBox(height: 8),

                      Text(cliente.telefone),

                      if (cliente.email != null && cliente.email!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),

                          child: Text(cliente.email!),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ==========================
                // ENTREGA
                // ==========================
                Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        cliente.tipoEntrega == "retirada"
                            ? "Retirada"
                            : "Entrega",

                        style: const TextStyle(
                          fontSize: 20,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        cliente.tipoEntrega == "retirada"
                            ? "Retirar na Gráfica Pergaminho\nAv. Alexandre Rasgulaeff, 2733\nJardim Santa Alice\nMaringá PR"
                            : cliente.endereco ?? "",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // ==========================
                // PIX
                // ==========================
                SizedBox(
                  width: double.infinity,
                  height: 58,

                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await Clipboard.setData(
                        const ClipboardData(text: chavePix),
                      );

                      if (!context.mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Chave PIX copiada")),
                      );
                    },

                    icon: const Icon(Icons.pix),

                    label: const Text("Copiar chave PIX"),
                  ),
                ),

                const SizedBox(height: 18),

                // ==========================
                // ENVIAR PEDIDO
                // ==========================
                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton.icon(
                    onPressed: pedidoProvider.carregando
                        ? null
                        : () async {
                            final pedido = PedidoModel(
                              clienteId: cliente.id!,

                              valorTotal: carrinhoProvider.total,

                              itens: carrinhoProvider.itens,
                            );

                            bool sucesso = await pedidoProvider.criarPedido(
                              pedido,
                            );

                            if (!context.mounted) {
                              return;
                            }

                            if (sucesso) {
                              carrinhoProvider.limparCarrinho();

                              showDialog(
                                context: context,

                                builder: (_) => AlertDialog(
                                  title: const Text("Pedido enviado"),

                                  content: const Text(
                                    "Seu pedido foi enviado com sucesso.",
                                  ),

                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (_) => const FirstPage(),
                                          ),

                                          (route) => false,
                                        );
                                      },

                                      child: const Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B4D2B),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    icon: pedidoProvider.carregando
                        ? const SizedBox(
                            width: 20,
                            height: 20,

                            child: CircularProgressIndicator(
                              strokeWidth: 2,

                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.send, color: Colors.white),

                    label: const Text(
                      "Enviar Pedido",

                      style: TextStyle(
                        fontSize: 18,

                        fontWeight: FontWeight.bold,

                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
