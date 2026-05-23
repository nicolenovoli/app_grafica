import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cliente_model.dart';

class ClienteProvider extends ChangeNotifier {

  ClienteModel? cliente;

  bool carregando = false;

  // URL DA API
  final String baseUrl =
      "http://10.0.2.2:8000";


  Future<bool> buscarClientePorTelefone(
    String telefone,
  ) async {

    carregando = true;

    notifyListeners();

    try {

      final response = await http.get(

        Uri.parse(
          "$baseUrl/clientes/telefone/$telefone",
        ),
      );

      // cliente encontrado
      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        cliente =
            ClienteModel.fromJson(data);

        carregando = false;

        notifyListeners();

        return true;
      }

      // cliente não encontrado
      carregando = false;

      notifyListeners();

      return false;

    } catch (e) {

      carregando = false;

      notifyListeners();

      return false;
    }
  }


  Future<bool> cadastrarCliente(
    ClienteModel novoCliente,
  ) async {

    carregando = true;

    notifyListeners();

    try {

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

        cliente =
            ClienteModel.fromJson(data);

        carregando = false;

        notifyListeners();

        return true;
      }

      carregando = false;

      notifyListeners();

      return false;

    } catch (e) {

        debugPrint(
    "ERRO CLIENTE: $e",
  );

      carregando = false;

      notifyListeners();

      return false;
    }
  }

  void limparCliente() {

    cliente = null;

    notifyListeners();
  }
}