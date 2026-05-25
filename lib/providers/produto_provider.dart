import 'package:flutter/material.dart';

import '../models/produto_model.dart';
import '../services/produto_service.dart';

class ProdutoProvider extends ChangeNotifier {

  final ProdutoService _service =
      ProdutoService();

  bool carregando = false;

  List<ProdutoModel> produtos = [];

  ProdutoModel? produto;

  Future<void> listarProdutos() async {

    carregando = true;

    notifyListeners();

    try {

      produtos = await _service
          .listarProdutos();

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

      produto = await _service
          .buscarProdutoPorId(
        produtoId,
      );

      carregando = false;

      notifyListeners();

      return produto != null;

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