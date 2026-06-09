import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';

import 'package:provider/provider.dart';

import '../models/pedido_model.dart';
import '../providers/pedido_provider.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final TextEditingController telefoneController = TextEditingController();

  bool pesquisou = false;

  List<PedidoModel> pedidos = [];

  bool carregando = false;

  Future<void> buscarPedidos() async {
    String telefone = telefoneController.text.replaceAll(RegExp(r'\D'), '');

    setState(() {
      carregando = true;
    });

    final provider = Provider.of<PedidoProvider>(context, listen: false);

    await provider.buscarPedidosPorTelefone(telefone);

    setState(() {
      pedidos = provider.pedidos;

      carregando = false;

      pesquisou = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const CustomAppBar(
              paginaAtual: "pedidos",
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(26, 0, 26, 26),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(height: 30),

                  const Text(
                    "Meus Pedidos",

                    style: TextStyle(
                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                      color: Color(0xFF003B2F),
                    ),
                  ),

                  const SizedBox(height: 30),

                  !pesquisou
                      ? _buildIdentificacao()
                      : carregando
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : pedidos.isEmpty
                      ? _buildSemPedidos()
                      : _buildListaPedidos(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ==========================================
  // IDENTIFICAÇÃO
  // ==========================================

  Widget _buildIdentificacao() {
    return Column(
      children: [
        const SizedBox(height: 80),

        Container(
          width: 120,
          height: 120,

          decoration: BoxDecoration(
            color: const Color(0xFFEDE9E3),
            borderRadius: BorderRadius.circular(60),
          ),

          child: const Icon(Icons.phone, size: 48, color: Color(0xFF0B4D2B)),
        ),

        const SizedBox(height: 32),

        const Text(
          "Identifique-se",

          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        const Text(
          "Informe seu telefone para visualizar seu histórico de pedidos.",

          textAlign: TextAlign.center,

          style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.5),
        ),

        const SizedBox(height: 40),

        Row(
          children: [
            Expanded(
              child: TextField(
                controller: telefoneController,

                keyboardType: TextInputType.phone,

                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,

                  LengthLimitingTextInputFormatter(11),

                  TelefoneInputFormatter(),
                ],

                decoration: InputDecoration(
                  hintText: "(00) 00000-0000",

                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),

                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            GestureDetector(
              onTap: () async {
                if (telefoneController.text.length < 15) {
                  return;
                }

                await buscarPedidos();
              },

              child: Container(
                width: 60,
                height: 60,

                decoration: BoxDecoration(
                  color: const Color(0xFF0B4D2B),
                  borderRadius: BorderRadius.circular(18),
                ),

                child: const Icon(Icons.search, color: Colors.white, size: 30),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ==========================================
  // SEM PEDIDOS
  // ==========================================

  Widget _buildSemPedidos() {
    return Column(
      children: [
        const SizedBox(height: 120),

        Container(
          width: 90,
          height: 90,

          decoration: BoxDecoration(
            color: const Color(0xFFEDE9E3),
            borderRadius: BorderRadius.circular(60),
          ),

          child: const Icon(
            Icons.assignment_outlined,
            size: 36,
            color: Color(0xFF5B7B63),
          ),
        ),

        const SizedBox(height: 32),

        const Text(
          "Nenhum pedido ainda",

          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        const Text(
          "Não encontramos pedidos para este telefone.",

          textAlign: TextAlign.center,

          style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.5),
        ),

        const SizedBox(height: 40),

        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    pesquisou = false;

                    telefoneController.clear();
                  });
                },

                style:
                    OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 52),

                      side: BorderSide(color: Colors.grey.shade300),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ).copyWith(
                      overlayColor: WidgetStateProperty.all(
                        const Color(0xFF0B4D2B).withValues(alpha: 0.02),
                      ),
                    ),

                child: const Text(
                  "Trocar telefone",

                  style: TextStyle(
                    color: Color(0xFF0B4D2B),

                    fontWeight: FontWeight.bold,

                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B4D2B),

                  minimumSize: const Size(0, 58),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                child: const Text(
                  "Ver catálogo",

                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListaPedidos() {
    return Column(
      children: [
        const SizedBox(height: 20),

        ...pedidos.map((pedido) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  pedido.itens.first.nomeProduto,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text("Quantidade: ${pedido.itens.first.quantidade}"),

                const SizedBox(height: 8),

                Text("Opções: ${pedido.itens.first.observacoes}"),

                const SizedBox(height: 8),

                Text("Valor: R\$ ${pedido.valorTotal.toStringAsFixed(2)}"),

                const SizedBox(height: 8),

                Text("Data: ${pedido.dataPedido?.split('T').first ?? ''}"),
              ],
            ),
          );
        }),
      ],
    );
  }
}

// ==========================================
// FORMATADOR DE TELEFONE
// ==========================================

class TelefoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String numeros = newValue.text.replaceAll(RegExp(r'\D'), '');

    // CAMPO VAZIO
    if (numeros.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    String textoFormatado = '';

    // DDD
    textoFormatado += '(';

    if (numeros.length >= 2) {
      textoFormatado += numeros.substring(0, 2);

      textoFormatado += ') ';
    } else {
      textoFormatado += numeros;
    }

    // Número
    if (numeros.length > 2) {
      if (numeros.length <= 7) {
        textoFormatado += numeros.substring(2);
      } else {
        textoFormatado += numeros.substring(2, 7);

        textoFormatado += '-';

        textoFormatado += numeros.substring(7);
      }
    }

    return TextEditingValue(
      text: textoFormatado,

      selection: TextSelection.collapsed(offset: textoFormatado.length),
    );
  }
}
