import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_pedido_model.dart';

import '../models/pedido_model.dart';
import '../services/pedido_service.dart';

class PedidoProvider extends ChangeNotifier {
  final PedidoService _service = PedidoService();

  bool carregando = false;

  List<PedidoModel> pedidos = [];

  PedidoModel? pedido;

  Future<bool> criarPedido(PedidoModel novoPedido) async {
    carregando = true;

    notifyListeners();

    try {
      pedido = await _service.criarPedido(novoPedido);

      carregando = false;

      notifyListeners();

      return pedido != null;
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
      pedidos = await _service.listarPedidos();
    } catch (e) {
      pedidos = [];
    }

    carregando = false;

    notifyListeners();
  }

  Future<bool> buscarPedidoPorId(int pedidoId) async {
    carregando = true;

    notifyListeners();

    try {
      pedido = await _service.buscarPedidoPorId(pedidoId);

      carregando = false;

      notifyListeners();

      return pedido != null;
    } catch (e) {
      carregando = false;

      notifyListeners();

      return false;
    }
  }

  Future<void> buscarPedidosPorTelefone(String telefone) async {
    carregando = true;

    notifyListeners();

    try {
      pedidos = await _service.buscarPedidosPorTelefone(telefone);
    } catch (e) {
      pedidos = [];
    }

    carregando = false;

    notifyListeners();
  }

  void limparPedidos() {
    pedidos.clear();

    notifyListeners();
  }

  void limparPedido() {
    pedido = null;

    notifyListeners();
  }

  Future<bool> finalizarPedido({
    required int clienteId,
    required double valorTotal,
    required List<ItemPedidoModel> itens,
  }) async {
    final pedido = PedidoModel(
      clienteId: clienteId,
      valorTotal: valorTotal,
      itens: itens,
    );

    return await criarPedido(pedido);
  }
}
