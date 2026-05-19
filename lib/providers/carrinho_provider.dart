import 'package:flutter/material.dart';

import '../models/item_pedido_model.dart';

import '../services/carrinho_service.dart';

class CarrinhoProvider
    extends ChangeNotifier {

  final List<ItemPedidoModel>
      _itens = [];

  List<ItemPedidoModel> get itens =>
      _itens;

  // ==========================================
  // QUANTIDADE TOTAL
  // ==========================================

  int get quantidadeItens {

    return CarrinhoService
        .calcularQuantidadeItens(
      _itens,
    );
  }

  // ==========================================
  // TOTAL CARRINHO
  // ==========================================

  double get totalCarrinho {

    return CarrinhoService
        .calcularTotalCarrinho(
      _itens,
    );
  }

  // ==========================================
  // ADICIONAR ITEM
  // ==========================================

  void adicionarItem(
    ItemPedidoModel item,
  ) {

    CarrinhoService.adicionarItem(
      _itens,
      item,
    );

    notifyListeners();
  }

  // ==========================================
  // REMOVER ITEM
  // ==========================================

  void removerItem(
    int index,
  ) {

    CarrinhoService.removerItem(
      _itens,
      index,
    );

    notifyListeners();
  }

  // ==========================================
  // LIMPAR CARRINHO
  // ==========================================

  void limparCarrinho() {

    _itens.clear();

    notifyListeners();
  }
}