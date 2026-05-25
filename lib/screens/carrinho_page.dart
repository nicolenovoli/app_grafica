import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/carrinho_provider.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/footer_section.dart';

class CarrinhoPage extends StatelessWidget {

  const CarrinhoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final carrinhoProvider =
        Provider.of<CarrinhoProvider>(
      context,
    );

    return Scaffold(

      backgroundColor:
          const Color(0xFFF7F6F2),

      body: Column(

        children: [

          const SizedBox(height: 30),

          // =====================================
          // CONTEÚDO + FOOTER
          // =====================================

          Expanded(

            child: LayoutBuilder(

              builder: (
                context,
                constraints,
              ) {

                return SingleChildScrollView(

                  child: ConstrainedBox(

                    constraints: BoxConstraints(
                      minHeight:
                          constraints.maxHeight,
                    ),

                    child: IntrinsicHeight(

                      child: Column(

                        children: [

                          Padding(

                            padding:
                                const EdgeInsets.all(
                              26,
                            ),

                            child: Column(

                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [

                                const Text(

                                  "Seu Carrinho",

                                  style: TextStyle(

                                    fontSize: 42,

                                    fontWeight:
                                        FontWeight.bold,

                                    color:
                                        Color(0xFF003B2F),
                                  ),
                                ),

                                const SizedBox(
                                  height: 40,
                                ),

                                // =====================================
                                // CARRINHO VAZIO
                                // =====================================

                                if (carrinhoProvider
                                    .itens
                                    .isEmpty)

                                  SizedBox(

                                    height: 500,

                                    child: Center(

                                      child: Column(

                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,

                                        children: [

                                          Container(

                                            width: 120,
                                            height: 120,

                                            decoration:
                                                BoxDecoration(

                                              color:
                                                  Colors.grey
                                                      .shade200,

                                              shape:
                                                  BoxShape.circle,
                                            ),

                                            child: const Icon(

                                              Icons.shopping_bag_outlined,

                                              size: 60,

                                              color:
                                                  Color(0xFF4F735E),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 30,
                                          ),

                                          const Text(

                                            "Carrinho vazio",

                                            style: TextStyle(

                                              fontSize: 34,

                                              fontWeight:
                                                  FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 14,
                                          ),

                                          Text(

                                            "Adicione produtos do nosso catálogo para começar.",

                                            style: TextStyle(

                                              fontSize: 20,

                                              color:
                                                  Colors.grey.shade700,
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 40,
                                          ),

                                          SizedBox(

                                            width: 240,
                                            height: 65,

                                            child: ElevatedButton(

                                              onPressed: () {

                                                Navigator.pop(
                                                  context,
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
                                                    22,
                                                  ),
                                                ),
                                              ),

                                              child: const Text(

                                                "Ver catálogo",

                                                style: TextStyle(

                                                  fontSize: 22,

                                                  fontWeight:
                                                      FontWeight.bold,

                                                  color:
                                                      Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                // =====================================
                                // COM ITENS
                                // =====================================

                                if (carrinhoProvider
                                    .itens
                                    .isNotEmpty)

                                  Row(

                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [

                                      // =================================
                                      // LISTA
                                      // =================================

                                      Expanded(

                                        flex: 3,

                                        child: ListView.builder(

                                          shrinkWrap: true,

                                          physics:
                                              const NeverScrollableScrollPhysics(),

                                          itemCount:
                                              carrinhoProvider
                                                  .itens
                                                  .length,

                                          itemBuilder:
                                              (
                                            context,
                                            index,
                                          ) {

                                            final item =
                                                carrinhoProvider
                                                    .itens[index];

                                            return Container(

                                              margin:
                                                  const EdgeInsets.only(
                                                bottom: 24,
                                              ),

                                              padding:
                                                  const EdgeInsets.all(
                                                24,
                                              ),

                                              decoration:
                                                  BoxDecoration(

                                                color:
                                                    Colors.white,

                                                borderRadius:
                                                    BorderRadius.circular(
                                                  28,
                                                ),

                                                border: Border.all(
                                                  color: Colors.grey
                                                      .shade300,
                                                ),
                                              ),

                                              child: Row(

                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,

                                                children: [

                                                  ClipRRect(

                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      18,
                                                    ),

                                                    child: Image.asset(

                                                      item.imagemProduto,

                                                      width: 130,
                                                      height: 130,

                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),

                                                  const SizedBox(
                                                    width: 24,
                                                  ),

                                                  Expanded(

                                                    child: Column(

                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,

                                                      children: [

                                                        Text(

                                                          item.nomeProduto,

                                                          style:
                                                              const TextStyle(

                                                            fontSize: 30,

                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),

                                                        const SizedBox(
                                                          height: 16,
                                                        ),

                                                        Text(

                                                          item.observacoes,

                                                          style:
                                                              TextStyle(

                                                            fontSize: 18,

                                                            color: Colors
                                                                .grey
                                                                .shade700,

                                                            height: 1.6,
                                                          ),
                                                        ),

                                                        const SizedBox(
                                                          height: 18,
                                                        ),

                                                        Text(

                                                          "Qtd: ${item.quantidade}",

                                                          style:
                                                              const TextStyle(

                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Column(

                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .end,

                                                    children: [

                                                      IconButton(

                                                        onPressed: () {

                                                          carrinhoProvider
                                                              .removerItem(
                                                            item,
                                                          );
                                                        },

                                                        icon: const Icon(

                                                          Icons.delete_outline,

                                                          color:
                                                              Color(0xFF4F735E),

                                                          size: 30,
                                                        ),
                                                      ),

                                                      const SizedBox(
                                                        height: 40,
                                                      ),

                                                      Text(

                                                        "R\$ ${item.subtotal.toStringAsFixed(2).replaceAll(".", ",")}",

                                                        style:
                                                            const TextStyle(

                                                          fontSize: 28,

                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,

                                                          color: Color(
                                                            0xFF003B2F,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 30,
                                      ),

                                      // =================================
                                      // RESUMO
                                      // =================================

                                      Container(

                                        width: 360,

                                        padding:
                                            const EdgeInsets.all(
                                          24,
                                        ),

                                        decoration:
                                            BoxDecoration(

                                          color: Colors.white,

                                          borderRadius:
                                              BorderRadius.circular(
                                            28,
                                          ),

                                          border: Border.all(
                                            color:
                                                Colors.grey.shade300,
                                          ),
                                        ),

                                        child: Column(

                                          crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,

                                          children: [

                                            const Text(

                                              "Resumo",

                                              style: TextStyle(

                                                fontSize: 30,

                                                fontWeight:
                                                    FontWeight.bold,
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 40,
                                            ),

                                            Row(

                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,

                                              children: [

                                                const Text(

                                                  "Total",

                                                  style: TextStyle(
                                                    fontSize: 24,
                                                  ),
                                                ),

                                                Text(

                                                  "R\$ ${carrinhoProvider.total.toStringAsFixed(2).replaceAll(".", ",")}",

                                                  style:
                                                      const TextStyle(

                                                    fontSize: 36,

                                                    fontWeight:
                                                        FontWeight.bold,

                                                    color: Color(
                                                      0xFF003B2F,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 40,
                                            ),

                                            SizedBox(

                                              width: double.infinity,
                                              height: 70,

                                              child: ElevatedButton(

                                                onPressed: () {},

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
                                                      22,
                                                    ),
                                                  ),
                                                ),

                                                child: const Text(

                                                  "Finalizar pedido",

                                                  style: TextStyle(

                                                    fontSize: 24,

                                                    fontWeight:
                                                        FontWeight.bold,

                                                    color:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 18,
                                            ),

                                            SizedBox(

                                              width: double.infinity,
                                              height: 70,

                                              child: OutlinedButton(

                                                onPressed: () {

                                                  Navigator.pop(
                                                    context,
                                                  );
                                                },

                                                style:
                                                    OutlinedButton.styleFrom(

                                                  shape:
                                                      RoundedRectangleBorder(

                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      22,
                                                    ),
                                                  ),
                                                ),

                                                child: const Text(

                                                  "Continuar comprando",

                                                  style: TextStyle(

                                                    fontSize: 22,

                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),

                          // =====================================
                          // FOOTER
                          // =====================================

                          const Spacer(),

                          const FooterSection(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}