import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/cliente_model.dart';

class ClienteService {

  final String baseUrl =
      "http://10.0.2.2:8000";

  Future<ClienteModel?>
      buscarClientePorTelefone(
    String telefone,
  ) async {

    final response = await http.get(

      Uri.parse(
        "$baseUrl/clientes/telefone/$telefone",
      ),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      return ClienteModel.fromJson(
        data,
      );
    }

    return null;
  }

  Future<ClienteModel?> cadastrarCliente(
    ClienteModel novoCliente,
  ) async {

    final response = await http.post(

      Uri.parse(
        "$baseUrl/clientes/",
      ),

      headers: {
        "Content-Type":
            "application/json",
      },

      body: jsonEncode(
        novoCliente.toJson(),
      ),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201) {

      final data =
          jsonDecode(response.body);

      return ClienteModel.fromJson(
        data,
      );
    }

    return null;
  }
}