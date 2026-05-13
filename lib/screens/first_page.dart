import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/produto_destaque.dart';
import '../widgets/secao_produtos.dart';
import '../widgets/custom_bottom_navbar.dart';

class FirstPage extends StatelessWidget {

  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(

      body: SingleChildScrollView(

        padding: EdgeInsets.only(
          bottom: 120,
        ),

        child: Column(

          children: [

            CustomAppBar(),

            SizedBox(height: 20),

            ProdutoDestaque(),

            SizedBox(height: 10),

            SecaoProdutos(),

            SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar:
          CustomBottomNavbar(),
    );
  }
}