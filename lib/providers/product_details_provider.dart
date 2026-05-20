import 'package:flutter/material.dart';

import '../models/produto_model.dart';
import '../models/produto_opcao_model.dart';

import '../services/product_details_service.dart';

class ProductDetailsProvider
    extends ChangeNotifier {

  // ==========================================
  // QUANTIDADE
  // ==========================================

  int quantidade = 1;

  // ==========================================
  // OPÇÕES SELECIONADAS
  // ==========================================

  final Map<String, String>
      opcoesSelecionadas = {};

  // ==========================================
  // OPÇÕES AGRUPADAS
  // ==========================================

  Map<String, List<ProdutoOpcaoModel>>
      opcoesAgrupadas = {};

  // ==========================================
  // INICIALIZAR
  // ==========================================

  void inicializar(
    ProdutoModel produto,
  ) {

    opcoesAgrupadas =
        ProductDetailsService
            .agruparOpcoes(
      produto,
    );

    opcoesSelecionadas.clear();

    opcoesAgrupadas.forEach(

      (grupo, listaOpcoes) {

        opcoesSelecionadas[grupo] =
            listaOpcoes.first.nome;
      },
    );

    quantidade = 1;

    notifyListeners();
  }

  // ==========================================
  // ALTERAR OPÇÃO
  // ==========================================

  void selecionarOpcao({

    required String grupo,

    required String nomeOpcao,
  }) {

    opcoesSelecionadas[grupo] =
        nomeOpcao;

    notifyListeners();
  }

  // ==========================================
  // AUMENTAR QUANTIDADE
  // ==========================================

  void aumentarQuantidade() {

    quantidade++;

    notifyListeners();
  }

  // ==========================================
  // DIMINUIR QUANTIDADE
  // ==========================================

  void diminuirQuantidade() {

    if (quantidade > 1) {

      quantidade--;

      notifyListeners();
    }
  }

  // ==========================================
  // VALOR UNITÁRIO
  // ==========================================

  double calcularValorUnitario(
    ProdutoModel produto,
  ) {

    return ProductDetailsService
        .calcularValorUnitario(

      produto: produto,

      opcoesSelecionadas:
          opcoesSelecionadas,

      opcoesAgrupadas:
          opcoesAgrupadas,
    );
  }

  // ==========================================
  // TOTAL
  // ==========================================

  double calcularTotal(
    ProdutoModel produto,
  ) {

    final valorUnitario =
        calcularValorUnitario(
      produto,
    );

    return ProductDetailsService
        .calcularTotal(

      valorUnitario:
          valorUnitario,

      quantidade:
          quantidade,
    );
  }
}