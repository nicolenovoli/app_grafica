import 'produto_opcao_model.dart';

class ProdutoModel {

  final int id;

  final String nome;

  final String descricao;

  final double precoBase;

  final String imagem;

  final List<ProdutoOpcaoModel>
      opcoes;

  ProdutoModel({

    required this.id,

    required this.nome,

    required this.descricao,

    required this.precoBase,

    required this.imagem,

    required this.opcoes,
  });

  factory ProdutoModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ProdutoModel(

      id: json["id"],

      nome: json["nome"],

      descricao: json["descricao"],

      precoBase:

          (json["preco_base"]
                  as num)
              .toDouble(),

      imagem:
          json["imagem"] ?? "",

      opcoes:

          json["opcoes"] != null

              ? (json["opcoes"]
                      as List)

                  .map(

                    (opcao) =>

                        ProdutoOpcaoModel
                            .fromJson(
                      opcao,
                    ),
                  )

                  .toList()

              : [],
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "id": id,

      "nome": nome,

      "descricao": descricao,

      "preco_base":
          precoBase,

      "imagem": imagem,

      "opcoes":

          opcoes.map(

            (opcao) =>
                opcao.toJson(),
          ).toList(),
    };
  }
}