class ItemPedidoModel {

  final int produtoId;

  // ==========================================
  // NOVOS CAMPOS
  // ==========================================

  final String nome;

  final String imagem;

  final int quantidade;

  final double valorUnitario;

  final double subtotal;

  final String observacoes;

  ItemPedidoModel({

    required this.produtoId,

    // ==========================================
    // NOVOS CAMPOS
    // ==========================================

    required this.nome,

    required this.imagem,

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

      // ==========================================
      // NOVOS CAMPOS
      // ==========================================

      nome: json["nome"] ?? "",

      imagem: json["imagem"] ?? "",

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

      // ==========================================
      // NOVOS CAMPOS
      // ==========================================

      "nome": nome,

      "imagem": imagem,

      "quantidade": quantidade,

      "valor_unitario": valorUnitario,

      "subtotal": subtotal,

      "observacoes": observacoes,
    };
  }
}