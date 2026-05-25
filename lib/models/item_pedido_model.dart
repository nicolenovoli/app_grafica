class ItemPedidoModel {

  final int produtoId;

  // =====================================
  // NOVOS CAMPOS
  // =====================================

  final String nomeProduto;

  final String imagemProduto;

  // =====================================

  final int quantidade;

  final double valorUnitario;

  final double subtotal;

  final String observacoes;

  ItemPedidoModel({

    required this.produtoId,

    // =====================================
    // NOVOS CAMPOS
    // =====================================

    required this.nomeProduto,

    required this.imagemProduto,

    // =====================================

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

      // =====================================
      // NOVOS CAMPOS
      // =====================================

      nomeProduto:
          json["nome_produto"] ?? "",

      imagemProduto:
          json["imagem_produto"] ?? "",

      // =====================================

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

      // =====================================
      // NOVOS CAMPOS
      // =====================================

      "nome_produto": nomeProduto,

      "imagem_produto": imagemProduto,

      // =====================================

      "quantidade": quantidade,

      "valor_unitario": valorUnitario,

      "subtotal": subtotal,

      "observacoes": observacoes,
    };
  }
}