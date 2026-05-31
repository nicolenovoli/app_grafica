import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final TextEditingController telefoneController = TextEditingController();

  bool pesquisou = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 30),

            const CustomAppBar(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),

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

                  pesquisou ? _buildSemPedidos() : _buildIdentificacao(),
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
              onTap: () {
                if (telefoneController.text.length < 15) {
                  return;
                }

                setState(() {
                  // futuramente:
                  // buscar pedidos na API

                  pesquisou = true;
                });
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
