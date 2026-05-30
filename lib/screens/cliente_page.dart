import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cliente_model.dart';
import '../providers/cliente_provider.dart';
import '../screens/resumo_pedido_page.dart';
import '../widgets/footer_section.dart';

class ClientePage extends StatefulWidget {

  const ClientePage({
    super.key,
  });

  @override
  State<ClientePage> createState() =>
      _ClientePageState();
}

class _ClientePageState
    extends State<ClientePage> {

  final _formKey =
      GlobalKey<FormState>();

  // =====================================
  // CONTROLLERS
  // =====================================

  final telefoneController =
      TextEditingController();

  final nomeController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final ruaController =
      TextEditingController();

  final numeroController =
      TextEditingController();

  final bairroController =
      TextEditingController();

  final cidadeController =
      TextEditingController();

  final ufController =
      TextEditingController();

  final cepController =
      TextEditingController();

  String tipoEntrega =
      "entrega";

  @override
  void dispose() {

    telefoneController.dispose();

    nomeController.dispose();

    emailController.dispose();

    ruaController.dispose();

    numeroController.dispose();

    bairroController.dispose();

    cidadeController.dispose();

    ufController.dispose();

    cepController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final clienteProvider =
        Provider.of<ClienteProvider>(
      context,
    );

    return Scaffold(

      backgroundColor:
          const Color(0xFFF7F6F2),

      body: SingleChildScrollView(

        child: Column(

          children: [

            Padding(

              padding:
                  const EdgeInsets.all(40),

              child: Center(

                child: ConstrainedBox(

                  constraints:
                      const BoxConstraints(
                    maxWidth: 900,
                  ),

                  child: Form(

                    key: _formKey,

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        // =====================================
                        // TOPO
                        // =====================================

                        Row(

                          children: [

                            IconButton(

                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },

                              icon: const Icon(
                                Icons.arrow_back,
                              ),
                            ),

                            const SizedBox(
                              width: 10,
                            ),

                            const Text(

                              "Identificação",

                              style: TextStyle(

                                fontSize: 38,

                                fontWeight:
                                    FontWeight.bold,

                                color:
                                    Color(
                                  0xFF0B4D2B,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        const Text(

                          "Informe seus dados para continuar o pedido.",

                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Colors.black54,
                          ),
                        ),

                        const SizedBox(
                          height: 35,
                        ),

                        // =====================================
                        // TELEFONE
                        // =====================================

                        _tituloCampo(
                          "TELEFONE *",
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Row(

                          children: [

                            Expanded(

                              child: _campoTexto(

                                controller:
                                    telefoneController,

                                hint:
                                    "(00) 00000-0000",

                               validator: (value) {

  if (value == null || value.isEmpty) {

    return "Informe o telefone";
  }

  final numeros = value.replaceAll(
    RegExp(r'[^0-9]'),
    '',
  );

  if (numeros.length != 11) {

    return "Telefone deve conter DDD + número";
  }

  return null;
},
                              ),
                            ),

                            const SizedBox(
                              width: 14,
                            ),

                            Container(

                              width: 58,
                              height: 58,

                              decoration:
                                  BoxDecoration(

                                color:
                                    const Color(
                                  0xFF0B4D2B,
                                ),

                                borderRadius:
                                    BorderRadius.circular(
                                  18,
                                ),
                              ),

                              child: IconButton(

                                onPressed: () async {

  final numeros = telefoneController.text.replaceAll(
    RegExp(r'[^0-9]'),
    '',
  );

  if (numeros.length != 11) {

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Informe um telefone válido com DDD",
        ),
      ),
    );

    return;
  }

  bool encontrou =
      await clienteProvider
          .buscarClientePorTelefone(

    telefoneController.text,
  );

  if (!context.mounted) {
    return;
  }

  // CLIENTE ENCONTRADO
  if (encontrou &&
      clienteProvider.cliente != null) {

    final cliente =
        clienteProvider.cliente!;

    nomeController.text =
        cliente.nome;

    emailController.text =
        cliente.email ?? "";

    tipoEntrega =
        cliente.tipoEntrega;

    setState(() {});

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content: Text(
          "Cliente encontrado!",
        ),
      ),
    );
  }

  // CLIENTE NÃO ENCONTRADO
  else {

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content: Text(
          "Cliente não encontrado. Continue preenchendo para cadastrar.",
        ),
      ),
    );
  }
},

                                icon: const Icon(

                                  Icons.search,

                                  color:
                                      Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 28,
                        ),

                        // =====================================
                        // NOME
                        // =====================================

                        _tituloCampo(
                          "NOME *",
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        _campoTexto(

                          controller:
                              nomeController,

                          hint:
                              "Seu nome completo",

                          validator: (value) {

                            if (value ==
                                    null ||
                                value.isEmpty) {

                              return
                                  "Informe o nome";
                            }

                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 28,
                        ),

                        // =====================================
                        // EMAIL
                        // =====================================

                        _tituloCampo(
                          "E-MAIL (OPCIONAL)",
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        _campoTexto(

                          controller:
                              emailController,

                          hint:
                              "seu@email.com",
                        ),

                        const SizedBox(
                          height: 35,
                        ),

                        // =====================================
                        // ENTREGA
                        // =====================================

                        _tituloCampo(
                          "TIPO DE PEDIDO *",
                        ),

                        const SizedBox(
                          height: 14,
                        ),

                        Row(

                          children: [

                            Expanded(

                              child:
                                  _tipoEntregaCard(

                                ativo:
                                    tipoEntrega ==
                                        "entrega",

                                titulo:
                                    "Entrega",

                                subtitulo:
                                    "Receba em casa",

                                icon:
                                    Icons.local_shipping_outlined,

                                onTap: () {

                                  setState(() {

                                    tipoEntrega =
                                        "entrega";
                                  });
                                },
                              ),
                            ),

                            const SizedBox(
                              width: 20,
                            ),

                            Expanded(

                              child:
                                  _tipoEntregaCard(

                                ativo:
                                    tipoEntrega ==
                                        "retirada",

                                titulo:
                                    "Retirada",

                                subtitulo:
                                    "Retirar na loja",

                                icon:
                                    Icons.storefront_outlined,

                                onTap: () {

                                  setState(() {

                                    tipoEntrega =
                                        "retirada";
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 35,
                        ),

                        // =====================================
                        // ENDEREÇO
                        // =====================================

                        if (tipoEntrega ==
                            "entrega") ...[

                          _tituloCampo(
                            "ENDEREÇO DE ENTREGA *",
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Row(

                            children: [

                              Expanded(

                                flex: 4,

                                child: _campoTexto(

                                  controller:
                                      ruaController,

                                  hint: "Rua",

                                  validator:
                                      (value) {

                                    if (tipoEntrega ==
                                            "entrega" &&
                                        (value ==
                                                null ||
                                            value
                                                .isEmpty)) {

                                      return
                                          "Informe a rua";
                                    }

                                    return null;
                                  },
                                ),
                              ),

                              const SizedBox(
                                width: 14,
                              ),

                              Expanded(

                                flex: 1,

                                child: _campoTexto(

                                  controller:
                                      numeroController,

                                  hint:
                                      "Nº",

                                  validator:
                                      (value) {

                                    if (tipoEntrega ==
                                            "entrega" &&
                                        (value ==
                                                null ||
                                            value
                                                .isEmpty)) {

                                      return
                                          "Número";
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 14,
                          ),

                          Row(

                            children: [

                              Expanded(

                                flex: 3,

                                child: _campoTexto(

                                  controller:
                                      bairroController,

                                  hint:
                                      "Bairro",

                                  validator:
                                      (value) {

                                    if (tipoEntrega ==
                                            "entrega" &&
                                        (value ==
                                                null ||
                                            value
                                                .isEmpty)) {

                                      return
                                          "Informe o bairro";
                                    }

                                    return null;
                                  },
                                ),
                              ),

                              const SizedBox(
                                width: 14,
                              ),

                              Expanded(

                                flex: 3,

                                child: _campoTexto(

                                  controller:
                                      cidadeController,

                                  hint:
                                      "Cidade",

                                  validator:
                                      (value) {

                                    if (tipoEntrega ==
                                            "entrega" &&
                                        (value ==
                                                null ||
                                            value
                                                .isEmpty)) {

                                      return
                                          "Informe a cidade";
                                    }

                                    return null;
                                  },
                                ),
                              ),

                              const SizedBox(
                                width: 14,
                              ),

                              Expanded(

                                flex: 1,

                                child: _campoTexto(

                                  controller:
                                      ufController,

                                  hint: "UF",

                                  validator:
                                      (value) {

                                    if (tipoEntrega ==
                                            "entrega" &&
                                        (value ==
                                                null ||
                                            value
                                                .isEmpty)) {

                                      return
                                          "UF";
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 14,
                          ),

                          _campoTexto(

                            controller:
                                cepController,

                            hint: "CEP",

                            validator:
                                (value) {

                              if (tipoEntrega ==
                                      "entrega" &&
                                  (value ==
                                          null ||
                                      value
                                          .isEmpty)) {

                                return
                                    "Informe o CEP";
                              }

                              return null;
                            },
                          ),

                          const SizedBox(
                            height: 40,
                          ),
                        ],

                        // =====================================
                        // BOTÃO
                        // =====================================

                        SizedBox(

                          width: double.infinity,

                          height: 60,

                          child: ElevatedButton(

                            onPressed:
                                clienteProvider
                                        .carregando
                                    ? null
                                    : () async {

                                        if (!_formKey
                                            .currentState!
                                            .validate()) {
                                          return;
                                        }

                                        String enderecoCompleto =
                                            """

Rua: ${ruaController.text}
Número: ${numeroController.text}
Bairro: ${bairroController.text}
Cidade: ${cidadeController.text}
UF: ${ufController.text}
CEP: ${cepController.text}

""";

                                        bool sucesso =
                                            await clienteProvider
                                                .cadastrarCliente(

                                          ClienteModel(

                                            nome:
                                                nomeController
                                                    .text,

                                            telefone:
                                                telefoneController
                                                    .text,

                                            email:
                                                emailController
                                                        .text
                                                        .isEmpty
                                                    ? null
                                                    : emailController
                                                        .text,

                                            tipoEntrega:
                                                tipoEntrega,

                                            endereco:
                                                tipoEntrega ==
                                                        "entrega"
                                                    ? enderecoCompleto
                                                    : null,
                                          ),
                                        );

                                        if (!context
                                            .mounted) {
                                          return;
                                        }

                                        if (sucesso) {

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ResumoPedidoPage(),
    ),
  );
}
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

                            child:
                                clienteProvider
                                        .carregando
                                    ? const CircularProgressIndicator(
                                        color:
                                            Colors
                                                .white,
                                      )
                                    : const Text(

                                        "CONTINUAR",

                                        style:
                                            TextStyle(

                                          fontSize:
                                              18,

                                          fontWeight:
                                              FontWeight
                                                  .bold,

                                          color:
                                              Colors
                                                  .white,
                                        ),
                                      ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _tituloCampo(
    String titulo,
  ) {

    return Text(

      titulo,

      style: const TextStyle(

        fontSize: 15,

        fontWeight:
            FontWeight.bold,

        color:
            Color(0xFF355E4C),
      ),
    );
  }

  Widget _campoTexto({

    required TextEditingController
        controller,

    required String hint,

    String? Function(String?)?
        validator,

    int maxLines = 1,
  }) {

    return TextFormField(

      controller: controller,

      validator: validator,

      maxLines: maxLines,

      decoration: InputDecoration(

        hintText: hint,

        filled: true,

        fillColor: Colors.white,

        contentPadding:
            const EdgeInsets.symmetric(

          horizontal: 20,
          vertical: 18,
        ),

        border: OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(18),

          borderSide: BorderSide(
            color:
                Colors.grey.shade300,
          ),
        ),

        enabledBorder:
            OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(18),

          borderSide: BorderSide(
            color:
                Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget _tipoEntregaCard({

    required bool ativo,

    required String titulo,

    required String subtitulo,

    required IconData icon,

    required VoidCallback onTap,
  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        padding:
            const EdgeInsets.all(24),

        decoration: BoxDecoration(

          color: ativo
              ? const Color(
                  0xFF0B4D2B,
                )
              : Colors.white,

          borderRadius:
              BorderRadius.circular(24),

          border: Border.all(

            color: ativo
                ? const Color(
                    0xFF0B4D2B,
                  )
                : Colors.grey.shade300,
          ),
        ),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Icon(

              icon,

              color: ativo
                  ? Colors.white
                  : Colors.black87,
            ),

            const SizedBox(
              height: 18,
            ),

            Text(

              titulo,

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                    FontWeight.bold,

                color: ativo
                    ? Colors.white
                    : Colors.black,
              ),
            ),

            const SizedBox(
              height: 6,
            ),

            Text(

              subtitulo,

              style: TextStyle(

                color: ativo
                    ? Colors.white70
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}