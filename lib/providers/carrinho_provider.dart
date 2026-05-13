import 'package:flutter/material.dart';

import '../models/item_pedido_model.dart';

class CarrinhoProvider
    extends ChangeNotifier {

  final List<ItemPedidoModel> _itens = [];

  List<ItemPedidoModel> get itens =>
      _itens;


  void adicionarItem(
    ItemPedidoModel item,
  ) {

    _itens.add(item);

    notifyListeners();
  }


  void removerItem(int index) {

    _itens.removeAt(index);

    notifyListeners();
  }


  void limparCarrinho() {

    _itens.clear();

    notifyListeners();
  }


  double get total {

    double soma = 0;

    for (var item in _itens) {

      soma += item.subtotal;
    }

    return soma;
  }
}