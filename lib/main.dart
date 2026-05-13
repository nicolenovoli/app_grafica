import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/produto_provider.dart';
import 'providers/carrinho_provider.dart';

import 'screens/first_page.dart';

void main() {

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => ProdutoProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => CarrinhoProvider(),
        ),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: const FirstPage(),
    );
  }
}