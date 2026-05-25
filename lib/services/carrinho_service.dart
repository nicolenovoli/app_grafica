import '../models/item_pedido_model.dart';

class CarrinhoService {

  final List<ItemPedidoModel>
      _itens = [];

  List<ItemPedidoModel> getItens() {

    return _itens;
  }

  void adicionarItem(
    ItemPedidoModel item,
  ) {

    _itens.add(item);
  }

  void removerItem(
    ItemPedidoModel item,
  ) {

    _itens.remove(item);
  }

  void limparCarrinho() {

    _itens.clear();
  }

  double calcularTotal() {

    double total = 0;

    for (var item in _itens) {

      total += item.subtotal;
    }

    return total;
  }
}