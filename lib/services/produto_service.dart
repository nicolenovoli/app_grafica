import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/produto_model.dart';

class ProdutoService {

  final String baseUrl =
      "http://localhost:8000";

  Future<List<ProdutoModel>>
      listarProdutos() async {

    final response = await http.get(

      Uri.parse(
        "$baseUrl/produtos/",
      ),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      return (data as List)

          .map(

            (produto) =>
                ProdutoModel.fromJson(
              produto,
            ),
          )

          .toList();
    }

    return [];
  }

  Future<ProdutoModel?>
      buscarProdutoPorId(
    int produtoId,
  ) async {

    final response = await http.get(

      Uri.parse(
        "$baseUrl/produtos/$produtoId",
      ),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      return ProdutoModel.fromJson(
        data,
      );
    }

    return null;
  }
}