class ProdutoModel {

  final int id;

  final String nome;

  final String descricao;

  final double valor;

  final String imagem;

  ProdutoModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.valor,
    required this.imagem,
  });

  factory ProdutoModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ProdutoModel(

      id: json["id"],

      nome: json["nome"],

      descricao: json["descricao"],

      valor: json["valor"].toDouble(),

      imagem: json["imagem"],
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "id": id,

      "nome": nome,

      "descricao": descricao,

      "valor": valor,

      "imagem": imagem,
    };
  }
}