import 'package:flutter/material.dart';

import '../models/cliente_model.dart';
import '../services/cliente_service.dart';

class ClienteProvider
    extends ChangeNotifier {

  final ClienteService _service =
      ClienteService();

  ClienteModel? cliente;

  bool carregando = false;

  Future<bool> buscarClientePorTelefone(
    String telefone,
  ) async {

    carregando = true;

    notifyListeners();

    try {

      cliente = await _service
          .buscarClientePorTelefone(
        telefone,
      );

      carregando = false;

      notifyListeners();

      return cliente != null;

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

      cliente = await _service
          .cadastrarCliente(
        novoCliente,
      );

      carregando = false;

      notifyListeners();

      return cliente != null;

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