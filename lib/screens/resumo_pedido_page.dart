import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:provider/provider.dart';

import '../providers/carrinho_provider.dart';
import '../providers/cliente_provider.dart';
import '../providers/pedido_provider.dart';

import 'cliente_page.dart';
import 'first_page.dart';

class ResumoPedidoPage extends StatelessWidget {
  const ResumoPedidoPage({super.key});

  static const String chavePix = AppConstants.chavePix;

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
          "Finalizar Pedido",
          style: TextStyle(
            fontSize: 22,
            color: Color(0xFF0B4D2B),
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(color: Color(0xFF0B4D2B)),
      ),

      backgroundColor: const Color(0xFFF7F6F2),
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
                        "Resumo do Pedido",

                        style: TextStyle(
                          fontSize: 16,

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
                              fontSize: 18,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "R\$ ${carrinhoProvider.total.toStringAsFixed(2).replaceAll(".", ",")}",

                            style: const TextStyle(
                              fontSize: 18,

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
                            "Dados do Cliente",

                            style: TextStyle(
                              fontSize: 16,

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

                            style: ButtonStyle(
                              overlayColor: WidgetStateProperty.all(
                                Colors.black.withValues(alpha: 0.02),
                              ),

                              shadowColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),

                              foregroundColor: WidgetStateProperty.all(
                                const Color(0xFF0B4D2B),
                              ),
                            ),

                            icon: const Icon(Icons.edit),

                            label: const Text(
                              "Editar",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            cliente.tipoEntrega == "retirada"
                                ? "Retirada"
                                : "Entrega",

                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 80),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Text(
                        cliente.tipoEntrega == "retirada"
                            ? AppConstants.enderecoRetirada
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
                        const ClipboardData(text: AppConstants.chavePix),
                      );

                      if (!context.mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Chave PIX copiada")),
                      );
                    },

                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(
                        Colors.black.withValues(alpha: 0.02),
                      ),

                      shadowColor: WidgetStateProperty.all(Colors.transparent),

                      side: WidgetStateProperty.all(
                        const BorderSide(color: Color(0xFF0B4D2B)),
                      ),

                      foregroundColor: WidgetStateProperty.all(
                        const Color(0xFF0B4D2B),
                      ),
                    ),

                    icon: const Icon(Icons.pix),

                    label: const Text(
                      "Copiar chave PIX",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                            bool sucesso = await pedidoProvider.finalizarPedido(
                              clienteId: cliente.id!,
                              valorTotal: carrinhoProvider.total,
                              itens: carrinhoProvider.itens,
                            );
                            if (!context.mounted) {
                              return;
                            }

                            if (sucesso) {
                              carrinhoProvider.limparCarrinho();

                              showDialog(
                                context: context,

                                builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),

                                  contentPadding: const EdgeInsets.all(30),

                                  content: SizedBox(
                                    width: 500,

                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,

                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,

                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,

                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF0B4D2B),
                                                Color(0xFF2E6B47),
                                              ],
                                            ),
                                          ),

                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 70,
                                          ),
                                        ),

                                        const SizedBox(height: 30),

                                        const Text(
                                          "Pedido Confirmado!",

                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 30),

                                        Container(
                                          padding: const EdgeInsets.all(20),

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),

                                            border: Border.all(
                                              color: const Color(0xFFDEE7E1),
                                            ),
                                          ),

                                          child: const Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 24,
                                                backgroundColor: Color(
                                                  0xFFF2EFEC,
                                                ),

                                                child: Icon(
                                                  Icons.mail_outline,
                                                  color: Color(0xFF0B4D2B),
                                                ),
                                              ),

                                              SizedBox(width: 16),

                                              Expanded(
                                                child: Text(
                                                  "Confirmação enviada por e-mail para a gráfica.",

                                                  textAlign: TextAlign.center,

                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF46655A),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 30),

                                        SizedBox(
                                          width: double.infinity,
                                          height: 50,

                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(
                                                context,
                                              ).pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      const FirstPage(),
                                                ),
                                                (route) => false,
                                              );
                                            },

                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                0xFF0B4D2B,
                                              ),

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),

                                            child: const Text(
                                              "OK",

                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                        fontSize: 14,

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
