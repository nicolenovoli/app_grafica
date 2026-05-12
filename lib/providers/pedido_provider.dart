import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pedido_model.dart';

class PedidoProvider extends ChangeNotifier {

  final String baseUrl =
      "http://10.0.2.2:8000";

  bool carregando = false;

  List<PedidoModel> pedidos = [];

  PedidoModel? pedido;

  Future<bool> criarPedido(
    PedidoModel novoPedido,
  ) async {

    carregando = true;

    notifyListeners();

    try {

      final response = await http.post(

        Uri.parse("$baseUrl/pedidos/"),

        headers: {
          "Content-Type":
              "application/json",
        },

        body: jsonEncode(
          novoPedido.toJson(),
        ),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        final data =
            jsonDecode(response.body);

        pedido =
            PedidoModel.fromJson(data);

        carregando = false;

        notifyListeners();

        return true;
      }

      carregando = false;

      notifyListeners();

      return false;

    } catch (e) {

      carregando = false;

      notifyListeners();

      return false;
    }
  }


  Future<void> listarPedidos() async {

    carregando = true;

    notifyListeners();

    try {

      final response = await http.get(
        Uri.parse("$baseUrl/pedidos/"),
      );

      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        pedidos = (data as List)

            .map(
              (pedido) =>
                  PedidoModel.fromJson(
                    pedido,
                  ),
            )

            .toList();
      }

    } catch (e) {

      pedidos = [];
    }

    carregando = false;

    notifyListeners();
  }


  Future<bool> buscarPedidoPorId(
    int pedidoId,
  ) async {

    carregando = true;

    notifyListeners();

    try {

      final response = await http.get(

        Uri.parse(
          "$baseUrl/pedidos/$pedidoId",
        ),
      );

      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        pedido =
            PedidoModel.fromJson(data);

        carregando = false;

        notifyListeners();

        return true;
      }

      carregando = false;

      notifyListeners();

      return false;

    } catch (e) {

      carregando = false;

      notifyListeners();

      return false;
    }
  }


  Future<void> buscarPedidosPorTelefone(
    String telefone,
  ) async {

    carregando = true;

    notifyListeners();

    try {

      final response = await http.get(

        Uri.parse(
          "$baseUrl/pedidos/cliente/$telefone",
        ),
      );

      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        pedidos = (data as List)

            .map(
              (pedido) =>
                  PedidoModel.fromJson(
                    pedido,
                  ),
            )

            .toList();
      }

    } catch (e) {

      pedidos = [];
    }

    carregando = false;

    notifyListeners();
  }

  // ==========================================
  // LIMPAR PEDIDO
  // ==========================================

  void limparPedido() {

    pedido = null;

    notifyListeners();
  }


  void limparPedidos() {

    pedidos.clear();

    notifyListeners();
  }
}