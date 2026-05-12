import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  final TextEditingController telefoneController =
      TextEditingController();

  bool pesquisou = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF7F6F2),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F6F2),

        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Meus Pedidos",

          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: pesquisou
            ? _buildPedidos()
            : _buildIdentificacao(),
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

          child: const Icon(
            Icons.phone,
            size: 48,
            color: Color(0xFF0B4D2B),
          ),
        ),

        const SizedBox(height: 32),

        const Text(
          "Identifique-se",

          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          "Informe seu telefone para visualizar seu histórico de pedidos.",

          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            height: 1.5,
          ),
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
                  hintText: "(DD) 99999-9999",

                  filled: true,
                  fillColor: Colors.white,

                  contentPadding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(18),

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

                  pesquisou = true;

                });

              },

              child: Container(
                width: 68,
                height: 68,

                decoration: BoxDecoration(
                  color: const Color(0xFF0B4D2B),
                  borderRadius:
                      BorderRadius.circular(18),
                ),

                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ==========================================
  // COM PEDIDOS
  // ==========================================

  Widget _buildPedidos() {

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

          children: [

            Text(
              "1 pedido para ${telefoneController.text}",
            ),

            TextButton(
              onPressed: () {

                setState(() {

                  pesquisou = false;

                  telefoneController.clear();

                });

              },

              child: const Text("Trocar"),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),

            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "PEDIDO #0001",

                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "06 de mai. de 2026, 19:59",
                      ),
                    ],
                  ),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFE8F0EA,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: const Text(
                      "EM ANDAMENTO",

                      style: TextStyle(
                        color: Color(0xFF0B4D2B),
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "1x Pastas Personalizadas",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "50 • Triplex 250g • Verniz total",
              ),

              const SizedBox(height: 20),

              Divider(color: Colors.grey.shade300),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: const [

                  Text(
                    "Retirada • 1 item",
                  ),

                  Text(
                    "R\$ 320,00",

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,

                      color: Color(0xFF0B4D2B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ==========================================
// FORMATADOR DE TELEFONE
// ==========================================

class TelefoneInputFormatter
    extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {

    String numeros =
        newValue.text.replaceAll(
      RegExp(r'\D'),
      '',
    );

    // CAMPO VAZIO
    if (numeros.isEmpty) {

      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(
          offset: 0,
        ),
      );
    }

    String textoFormatado = '';

    // DDD
    textoFormatado += '(';

    if (numeros.length >= 2) {

      textoFormatado +=
          numeros.substring(0, 2);

      textoFormatado += ') ';
    }
    else {

      textoFormatado += numeros;
    }

    // Número
    if (numeros.length > 2) {

      if (numeros.length <= 7) {

        textoFormatado +=
            numeros.substring(2);

      } else {

        textoFormatado +=
            numeros.substring(2, 7);

        textoFormatado += '-';

        textoFormatado +=
            numeros.substring(7);
      }
    }

    return TextEditingValue(
      text: textoFormatado,

      selection: TextSelection.collapsed(
        offset: textoFormatado.length,
      ),
    );
  }
}