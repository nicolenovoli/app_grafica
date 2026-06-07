import 'package:flutter/material.dart';

import '../models/produto_model.dart';

import '../screens/product_details_page.dart';

class ProdutoItem extends StatefulWidget {

  final ProdutoModel produto;

  const ProdutoItem({
    super.key,
    required this.produto,
  });

  @override
  State<ProdutoItem> createState() =>
      _ProdutoItemState();
}

class _ProdutoItemState
    extends State<ProdutoItem> {

  bool hover = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(

      cursor: SystemMouseCursors.click,

      onEnter: (_) {

        setState(() {
          hover = true;
        });
      },

      onExit: (_) {

        setState(() {
          hover = false;
        });
      },

      child: AnimatedContainer(

        duration: const Duration(
          milliseconds: 250,
        ),

        transform: Matrix4.identity()
          ..translateByDouble(
            0.0,
            hover ? -8.0 : 0.0,
            0.0,
            1.0,
          ),

        margin: const EdgeInsets.only(
          bottom: 24,
        ),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(28),

          boxShadow: [

            BoxShadow(

              color: hover
                  ? Colors.black12
                  : Colors.black.withValues(
                      alpha: 0.05,
                    ),

              blurRadius:
                  hover ? 22 : 10,

              offset:
                  const Offset(0, 6),
            ),
          ],
        ),

        child: InkWell(

          borderRadius:
              BorderRadius.circular(28),

          onTap: () {

            Navigator.push(

              context,

              MaterialPageRoute(

                builder: (_) =>
                    ProductDetailsPage(
                  produto: widget.produto,
                ),
              ),
            );
          },

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // =====================================
              // IMAGEM
              // =====================================

              ClipRRect(

                borderRadius:
                    const BorderRadius.only(

                  topLeft:
                      Radius.circular(28),

                  topRight:
                      Radius.circular(28),
                ),

                child: SizedBox(

                  width: double.infinity,
                  height: 220,

                  child: Image.asset(

                    widget.produto.nome == "Cartões de Visita"
    ? "assets/cartao2.webp"

      : widget.produto.nome == "Panfletos"
          ? "assets/panfletos.jpg"

            : widget.produto.nome == "Pastas Personalizadas"
                ? "assets/pasta.jpg"

                  : widget.produto.nome == "Cartazes"
                      ? "assets/cartaz.jpeg"

                        : widget.produto.nome == "Folders"
                            ? "assets/folder.jpg"

                              : widget.produto.nome ==
                                      "Etiquetas Adesivas"
                                  ? "assets/etiqueta.jpeg"

                                    : widget.produto.nome ==
                                            "Receituário Médico"
                                        ? "assets/receituario1.png"
          


    : "assets/${widget.produto.imagem}",

                    fit: BoxFit.cover,

                    errorBuilder:
                        (
                      context,
                      error,
                      stackTrace,
                    ) {

                      return Container(

                        color:
                            Colors.grey.shade200,

                        child: const Center(

                          child: Icon(

                            Icons.image,

                            size: 60,

                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // =====================================
              // CONTEÚDO
              // =====================================

              Padding(

                padding:
                    const EdgeInsets.all(22),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Expanded(

                          child: Column(

                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(

                                widget.produto.nome,

                                style: const TextStyle(

                                  fontSize: 22,

                                  fontWeight:
                                      FontWeight.bold,

                                  color:
                                      Color(0xFF0B4D2B),
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              Text(

                                widget.produto.descricao,

                                maxLines: 2,

                                overflow:
                                    TextOverflow.ellipsis,

                                style: const TextStyle(

                                  fontSize: 15,

                                  color:
                                      Colors.black54,

                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 14,
                        ),

                        Container(

                          width: 48,
                          height: 48,

                          decoration: BoxDecoration(

                            color:
                                const Color(0xFF0B4D2B),

                            borderRadius:
                                BorderRadius.circular(16),
                          ),

                          child: const Icon(

                            Icons.arrow_forward,

                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    Text(

                      "a partir de R\$ ${widget.produto.precoBase.toStringAsFixed(2).replaceAll(".", ",")}",

                      style: const TextStyle(

                        fontSize: 20,

                        fontWeight:
                            FontWeight.bold,

                        color:
                            Color(0xFF0B4D2B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}