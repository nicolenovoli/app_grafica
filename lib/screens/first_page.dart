import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/footer_section.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/produto_destaque.dart';
import '../widgets/secao_produtos.dart';

class FirstPage extends StatelessWidget {

  const FirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(

        padding: EdgeInsets.zero,

        child: Column(

          children: [

            CustomAppBar(
              paginaAtual: "catalogo",
            ),

            SizedBox(height: 20),

            ProdutoDestaque(),

            SizedBox(height: 10),

            SecaoProdutos(),

            SizedBox(height: 30),

            FooterSection(),
          ],
        ),
      ),
    );
  }
}