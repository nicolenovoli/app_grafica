import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/carrinho_provider.dart';

class CartPage extends StatelessWidget {

  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final carrinho =
        Provider.of<CarrinhoProvider>(
      context,
    );

    return Scaffold(

      backgroundColor:
          const Color(0xFFF7F6F2),

      appBar: AppBar(

        backgroundColor:
            const Color(0xFFF7F6F2),

        elevation: 0,

        centerTitle: true,

        title: const Text(

          "Seu Carrinho",

          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body:

          carrinho.itens.isEmpty

              ? _carrinhoVazio(context)

              : Column(

                  children: [

                    // ======================================
                    // LISTA DE ITENS
                    // ======================================

                    Expanded(

                      child: ListView.builder(

                        padding:
                            const EdgeInsets.all(
                          20,
                        ),

                        itemCount:
                            carrinho.itens.length,

                        itemBuilder:
                            (context, index) {

                          final item =
                              carrinho
                                  .itens[index];

                          return Container(

                            margin:
                                const EdgeInsets.only(
                              bottom: 16,
                            ),

                            padding:
                                const EdgeInsets.all(
                              16,
                            ),

                            decoration:
                                BoxDecoration(

                              color:
                                  Colors.white,

                              borderRadius:
                                  BorderRadius.circular(
                                24,
                              ),
                            ),

                            child: Row(

                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                // ======================================
                                // IMAGEM
                                // ======================================

                                Container(

                                  width: 82,
                                  height: 82,

                                  decoration:
                                      BoxDecoration(

                                    color:
                                        Colors.grey.shade200,

                                    borderRadius:
                                        BorderRadius.circular(
                                      18,
                                    ),
                                  ),

                                  child: ClipRRect(

                                    borderRadius:
                                        BorderRadius.circular(
                                      18,
                                    ),

                                    child: item.imagem
                                            .isNotEmpty

                                        ? Image.asset(

                                            "assets/${item.imagem}",

                                            fit: BoxFit.cover,

                                            errorBuilder:
                                                (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {

                                              return const Icon(
                                                Icons.image,
                                                size: 40,
                                                color: Colors.grey,
                                              );
                                            },
                                          )

                                        : const Icon(
                                            Icons.image,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 16,
                                ),

                                // ======================================
                                // INFORMAÇÕES
                                // ======================================

                                Expanded(

                                  child: Column(

                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [

                                      Row(

                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [

                                          Expanded(

                                            child: Text(

                                              item.nome,

                                              style:
                                                  const TextStyle(

                                                fontWeight:
                                                    FontWeight.bold,

                                                fontSize:
                                                    20,
                                              ),
                                            ),
                                          ),

                                          GestureDetector(

                                            onTap: () {

                                              carrinho
                                                  .removerItem(
                                                index,
                                              );
                                            },

                                            child: const Icon(

                                              Icons
                                                  .delete_outline,

                                              color: Color(
                                                0xFF486B57,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      // ======================================
                                      // OPÇÕES
                                      // ======================================

                                      ...item
                                          .observacoes
                                          .split(",")

                                          .map(

                                        (opcao) {

                                          return Padding(

                                            padding:
                                                const EdgeInsets.only(
                                              bottom: 2,
                                            ),

                                            child: Text(

                                              "• ${opcao.trim()}",

                                              style:
                                                  const TextStyle(

                                                color:
                                                    Color(
                                                  0xFF486B57,
                                                ),

                                                fontSize:
                                                    14,
                                              ),
                                            ),
                                          );
                                        },
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      Row(

                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,

                                        children: [

                                          Text(

                                            "Quantidade: ${item.quantidade}",

                                            style:
                                                const TextStyle(

                                              color:
                                                  Colors.black54,

                                              fontSize:
                                                  15,
                                            ),
                                          ),

                                          Text(

                                            "R\$ ${item.subtotal.toStringAsFixed(2).replaceAll(".", ",")}",

                                            style:
                                                const TextStyle(

                                              fontWeight:
                                                  FontWeight.bold,

                                              color:
                                                  Color(
                                                0xFF0B4D2B,
                                              ),

                                              fontSize:
                                                  20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // ======================================
                    // TOTAL + BOTÕES
                    // ======================================

                    Container(

                      padding:
                          const EdgeInsets.all(
                        24,
                      ),

                      decoration:
                          const BoxDecoration(

                        color: Colors.white,

                        border: Border(

                          top: BorderSide(
                            color: Color(
                              0xFFE5E5E5,
                            ),
                          ),
                        ),
                      ),

                      child: Column(

                        children: [

                          Row(

                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,

                            children: [

                              const Text(

                                "Total do Pedido",

                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(
                                    0xFF486B57,
                                  ),
                                ),
                              ),

                              Text(

                                "R\$ ${carrinho.totalCarrinho.toStringAsFixed(2).replaceAll(".", ",")}",

                                style:
                                    const TextStyle(

                                  fontSize: 28,

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
                            height: 24,
                          ),

                          Row(

                            children: [

                              // ======================================
                              // CONTINUAR
                              // ======================================

                              Expanded(

                                child: SizedBox(

                                  height: 60,

                                  child:
                                      OutlinedButton(

                                    onPressed: () {

                                      Navigator.pop(
                                        context,
                                      );
                                    },

                                    style:
                                        OutlinedButton.styleFrom(

                                      side:
                                          BorderSide(

                                        color:
                                            Colors.grey.shade300,
                                      ),

                                      shape:
                                          RoundedRectangleBorder(

                                        borderRadius:
                                            BorderRadius.circular(
                                          22,
                                        ),
                                      ),
                                    ),

                                    child:
                                        const Text(

                                      "Continuar",

                                      style: TextStyle(

                                        color:
                                            Colors.black,

                                        fontSize: 18,

                                        fontWeight:
                                            FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                width: 16,
                              ),

                              // ======================================
                              // FINALIZAR
                              // ======================================

                              Expanded(

                                flex: 2,

                                child: SizedBox(

                                  height: 60,

                                  child:
                                      ElevatedButton(

                                    onPressed: () {

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(

                                        const SnackBar(

                                          content: Text(
                                            "Pedido finalizado com sucesso!",
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

                                      elevation: 0,

                                      shape:
                                          RoundedRectangleBorder(

                                        borderRadius:
                                            BorderRadius.circular(
                                          22,
                                        ),
                                      ),
                                    ),

                                    child:
                                        const Text(

                                      "Finalizar Pedido",

                                      style: TextStyle(

                                        color:
                                            Colors.white,

                                        fontSize: 18,

                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  // ==========================================
  // CARRINHO VAZIO
  // ==========================================

  Widget _carrinhoVazio(
    BuildContext context,
  ) {

    return Center(

      child: Padding(

        padding:
            const EdgeInsets.symmetric(
          horizontal: 30,
        ),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Container(

              width: 120,
              height: 120,

              decoration: BoxDecoration(

                color: Colors.grey.shade200,

                shape: BoxShape.circle,
              ),

              child: const Icon(

                Icons.shopping_bag_outlined,

                size: 60,

                color: Color(0xFF486B57),
              ),
            ),

            const SizedBox(
              height: 26,
            ),

            const Text(

              "Carrinho Vazio",

              style: TextStyle(

                fontSize: 34,

                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 14,
            ),

            const Text(

              "Adicione produtos do nosso catálogo para começar",

              textAlign: TextAlign.center,

              style: TextStyle(

                fontSize: 18,

                color: Color(
                  0xFF486B57,
                ),
              ),
            ),

            const SizedBox(
              height: 34,
            ),

            SizedBox(

              width: 200,
              height: 60,

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

                  elevation: 0,

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(
                      22,
                    ),
                  ),
                ),

                child: const Text(

                  "Ver Catálogo",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 20,

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}