import '../models/item_pedido_model.dart';

class CarrinhoService {

  // ==========================================
  // TOTAL DE ITENS
  // ==========================================

  static int calcularQuantidadeItens(

    List<ItemPedidoModel> itens,
  ) {

    int total = 0;

    for (var item in itens) {

      total += item.quantidade;
    }

    return total;
  }

  // ==========================================
  // TOTAL CARRINHO
  // ==========================================

  static double calcularTotalCarrinho(

    List<ItemPedidoModel> itens,
  ) {

    double total = 0;

    for (var item in itens) {

      total += item.subtotal;
    }

    return total;
  }

  // ==========================================
  // ADICIONAR ITEM
  // ==========================================

  static List<ItemPedidoModel> adicionarItem(

    List<ItemPedidoModel> itens,

    ItemPedidoModel novoItem,
  ) {

    itens.add(novoItem);

    return itens;
  }

  // ==========================================
  // REMOVER ITEM
  // ==========================================

  static List<ItemPedidoModel> removerItem(

    List<ItemPedidoModel> itens,

    int index,
  ) {

    itens.removeAt(index);

    return itens;
  }
}