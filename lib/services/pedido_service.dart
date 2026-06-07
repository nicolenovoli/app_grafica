import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pedido_model.dart';

class PedidoService {

  final String baseUrl =
      "http://127.0.0.1:8000";

  Future<PedidoModel?> criarPedido(
    PedidoModel novoPedido,
  ) async {

    final response = await http.post(

      Uri.parse(
        "$baseUrl/pedidos/",
      ),

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

      return PedidoModel.fromJson(
        data,
      );
    }


    return null;
  }

  Future<List<PedidoModel>>
      listarPedidos() async {

    final response = await http.get(
      Uri.parse(
        "$baseUrl/pedidos/",
      ),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      return (data as List)

          .map(
            (pedido) =>
                PedidoModel.fromJson(
              pedido,
            ),
          )

          .toList();
    }

    return [];
  }



  Future<PedidoModel?> buscarPedidoPorId(
    int pedidoId,
  ) async {

    final response = await http.get(

      Uri.parse(
        "$baseUrl/pedidos/$pedidoId",
      ),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      return PedidoModel.fromJson(
        data,
      );
    }

    return null;
  }

  Future<List<PedidoModel>>
      buscarPedidosPorTelefone(
    String telefone,
  ) async {

    final response = await http.get(

      Uri.parse(
        "$baseUrl/pedidos/cliente/$telefone",
      ),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      return (data as List)

          .map(
            (pedido) =>
                PedidoModel.fromJson(
              pedido,
            ),
          )

          .toList();
    }

    return [];
  }
}