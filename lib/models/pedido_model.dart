import 'item_pedido_model.dart';

class PedidoModel {

  final int? id;

  final int clienteId;

  final double valorTotal;

  final List<ItemPedidoModel> itens;

  PedidoModel({
    this.id,
    required this.clienteId,
    required this.valorTotal,
    required this.itens,
  });

  factory PedidoModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return PedidoModel(

      id: json["id"],

      clienteId: json["cliente_id"],

      valorTotal:
          json["valor_total"].toDouble(),

      itens: (json["itens"] as List)

          .map(
            (item) =>
                ItemPedidoModel.fromJson(item),
          )

          .toList(),
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "cliente_id": clienteId,

      "valor_total": valorTotal,

      "itens":
          itens.map((e) => e.toJson()).toList(),
    };
  }
}