import 'package:flutter/material.dart';

import '../models/produto_model.dart';

import '../screens/product_details_page.dart';

class ProdutoItem
    extends StatelessWidget {

  final ProdutoModel produto;

  const ProdutoItem({

    super.key,

    required this.produto,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(
        bottom: 22,
      ),

      child: InkWell(

        borderRadius:
            BorderRadius.circular(20),

        onTap: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>

                  ProductDetailsPage(
                produto: produto,
              ),
            ),
          );
        },

        child: Row(

          children: [

            // IMAGEM
            ClipRRect(

              borderRadius:
                  BorderRadius.circular(
                20,
              ),

              child: Image.asset(

                "assets/placeholder.png",

                width: 85,
                height: 85,

                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 16),

            // TEXTO
            Expanded(

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(

                    produto.nome,

                    style:
                        const TextStyle(

                      fontSize: 22,

                      fontWeight:
                          FontWeight.bold,

                      color: Color(
                        0xFF0B4D2B,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Text(

                    produto.descricao,

                    style:
                        const TextStyle(

                      fontSize: 16,

                      color:
                          Colors.black54,
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(

                    "R\$ ${produto.precoBase.toStringAsFixed(2).replaceAll(".", ",")}",

                    style:
                        const TextStyle(

                      fontSize: 20,

                      fontWeight:
                          FontWeight.bold,

                      color: Color(
                        0xFF0B4D2B,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // BOTÃO +
            Container(

              width: 52,
              height: 52,

              decoration:
                  BoxDecoration(

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),

                border: Border.all(
                  color:
                      Colors.grey.shade300,
                ),
              ),

              child: const Icon(

                Icons.add,

                color: Color(
                  0xFF0B4D2B,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}