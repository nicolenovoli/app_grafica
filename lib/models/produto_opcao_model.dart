class ProdutoOpcaoModel {

  final int id;

  final String grupo;

  final String nome;

  final double valorAdicional;

  ProdutoOpcaoModel({

    required this.id,

    required this.grupo,

    required this.nome,

    required this.valorAdicional,
  });

  factory ProdutoOpcaoModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ProdutoOpcaoModel(

      id: json["id"],

      grupo: json["grupo"],

      nome: json["nome"],

      valorAdicional:
          json["valor_adicional"]
              .toDouble(),
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "id": id,

      "grupo": grupo,

      "nome": nome,

      "valor_adicional":
          valorAdicional,
    };
  }
}