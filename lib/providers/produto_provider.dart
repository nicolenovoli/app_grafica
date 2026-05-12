import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/produto_model.dart';

class ProdutoProvider extends ChangeNotifier {

  final String baseUrl =
      "http://10.0.2.2:8000";

  bool carregando = false;

  List<ProdutoModel> produtos = [];

  ProdutoModel? produto;


  Future<void> listarProdutos() async {

    carregando = true;

    notifyListeners();

    try {

      final response = await http.get(
        Uri.parse("$baseUrl/produtos/"),
      );

      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        produtos = (data as List)

            .map(
              (produto) =>
                  ProdutoModel.fromJson(
                    produto,
                  ),
            )

            .toList();
      }

    } catch (e) {

      produtos = [];
    }

    carregando = false;

    notifyListeners();
  }


  Future<bool> buscarProdutoPorId(
    int produtoId,
  ) async {

    carregando = true;

    notifyListeners();

    try {

      final response = await http.get(

        Uri.parse(
          "$baseUrl/produtos/$produtoId",
        ),
      );

      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        produto =
            ProdutoModel.fromJson(data);

        carregando = false;

        notifyListeners();

        return true;
      }

      carregando = false;

      notifyListeners();

      return false;

    } catch (e) {

      carregando = false;

      notifyListeners();

      return false;
    }
  }


  void limparProduto() {

    produto = null;

    notifyListeners();
  }


  void limparProdutos() {

    produtos.clear();

    notifyListeners();
  }
}