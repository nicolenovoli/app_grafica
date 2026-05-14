import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/produto_provider.dart';

import 'produto_item.dart';

class SecaoProdutos
    extends StatefulWidget {

  const SecaoProdutos({
    super.key,
  });

  @override
  State<SecaoProdutos>
      createState() =>
          _SecaoProdutosState();
}

class _SecaoProdutosState
    extends State<SecaoProdutos> {

@override
void initState() {

  super.initState();

  WidgetsBinding.instance
      .addPostFrameCallback((_) {

    if (!mounted) return;

    Provider.of<ProdutoProvider>(

      context,

      listen: false,

    ).listarProdutos();
  });
}

  @override
  Widget build(BuildContext context) {

    final produtoProvider =

        Provider.of<ProdutoProvider>(
      context,
    );

    if (produtoProvider.carregando) {

      return const Padding(

        padding: EdgeInsets.all(40),

        child: Center(
          child:
              CircularProgressIndicator(),
        ),
      );
    }

    return Padding(

      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      child: Column(

        children: [

          // TOPO
          Row(

            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

            children: [

              const Text(

                'Para sua Marca',

                style: TextStyle(

                  fontSize: 28,

                  fontWeight:
                      FontWeight.bold,

                  color:
                      Color(0xFF0B4D2B),
                ),
              ),

              Text(

                '${produtoProvider.produtos.length} ITENS',

                style: TextStyle(

                  fontSize: 16,

                  fontWeight:
                      FontWeight.bold,

                  color:
                      Colors.grey.shade700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // PRODUTOS
          ...produtoProvider.produtos.map(

            (produto) {

              return ProdutoItem(
                produto: produto,
              );
            },
          ),
        ],
      ),
    );
  }
}