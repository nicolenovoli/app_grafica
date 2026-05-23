class ClienteModel {

  final int? id;

  final String nome;

  final String telefone;

  final String? email;

  final String tipoEntrega;

  final String? endereco;

  ClienteModel({

    this.id,

    required this.nome,

    required this.telefone,

    this.email,

    required this.tipoEntrega,

    this.endereco,
  });

  factory ClienteModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ClienteModel(

      id: json["id"],

      nome: json["nome"],

      telefone: json["telefone"],

      email: json["email"],

      tipoEntrega:
          json["tipo_entrega"],

      endereco: json["endereco"],
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "nome": nome,

      "telefone": telefone,

      "email": email,

      "tipo_entrega":
          tipoEntrega,

      "endereco": endereco,
    };
  }
}