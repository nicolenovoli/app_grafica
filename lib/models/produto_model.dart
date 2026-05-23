import 'produto_opcao_model.dart';

class ProdutoModel {

  final int id;

  final String nome;

  final String descricao;

  final double precoBase;

  final List<ProdutoOpcaoModel>
      opcoes;

  ProdutoModel({

    required this.id,

    required this.nome,

    required this.descricao,

    required this.precoBase,

    required this.opcoes,
  });

  // =====================================
  // IMAGEM LOCAL
  // =====================================

  String get imagem {

    switch (nome.toLowerCase()) {

      case "cartões de visita":
        return "assets/cartao1.png";

      case "panfletos":
        return "assets/panfletos.png";

      case "pastas personalizadas":
        return "assets/pastas.png";

      case "cartazes":
        return "assets/cartazes.png";

      case "folders":
        return "assets/folders.png";

      case "etiquetas adesivas":
        return "assets/etiquetas.png";

      case "receituário médico":
        return "assets/receituario.png";

      default:
        return "assets/placeholder.png";
    }
  }

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

      "opcoes":

          opcoes.map(

            (opcao) =>
                opcao.toJson(),
          ).toList(),
    };
  }
}