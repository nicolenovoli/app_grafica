import 'package:flutter/material.dart';

import '../models/item_pedido_model.dart';
import '../services/carrinho_service.dart';

class CarrinhoProvider
    extends ChangeNotifier {

  final CarrinhoService _service =
      CarrinhoService();

  List<ItemPedidoModel> get itens =>
      _service.getItens();

  double get total =>
      _service.calcularTotal();

  void adicionarItem(
    ItemPedidoModel item,
  ) {

    _service.adicionarItem(item);

    notifyListeners();
  }

  void removerItem(
    ItemPedidoModel item,
  ) {

    _service.removerItem(item);

    notifyListeners();
  }

  void limparCarrinho() {

    _service.limparCarrinho();

    notifyListeners();
  }
}
