class ItemPedidoModel {

  final int produtoId;

  final int quantidade;

  final double valorUnitario;

  final double subtotal;

  final String observacoes;

  ItemPedidoModel({
    required this.produtoId,
    required this.quantidade,
    required this.valorUnitario,
    required this.subtotal,
    required this.observacoes,
  });

  factory ItemPedidoModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ItemPedidoModel(
      produtoId: json["produto_id"],

      quantidade: json["quantidade"],

      valorUnitario:
          json["valor_unitario"].toDouble(),

      subtotal:
          json["subtotal"].toDouble(),

      observacoes:
          json["observacoes"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "produto_id": produtoId,

      "quantidade": quantidade,

      "valor_unitario": valorUnitario,

      "subtotal": subtotal,

      "observacoes": observacoes,

    };
  }
}