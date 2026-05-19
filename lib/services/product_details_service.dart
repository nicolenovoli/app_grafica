import '../models/produto_model.dart';
import '../models/produto_opcao_model.dart';

class ProductDetailsService {

  // ==========================================
  // AGRUPAR OPÇÕES
  // ==========================================

  static Map<String,
      List<ProdutoOpcaoModel>>
  agruparOpcoes(
    ProdutoModel produto,
  ) {

    Map<String,
        List<ProdutoOpcaoModel>>
    opcoesAgrupadas = {};

    for (var opcao
        in produto.opcoes) {

      if (!opcoesAgrupadas
          .containsKey(
        opcao.grupo,
      )) {

        opcoesAgrupadas[
            opcao.grupo] = [];
      }

      opcoesAgrupadas[
          opcao.grupo]!
          .add(opcao);
    }

    return opcoesAgrupadas;
  }

  // ==========================================
  // CALCULAR VALOR
  // ==========================================

  static double calcularValorUnitario({

    required ProdutoModel produto,

    required Map<String,
        String> opcoesSelecionadas,

    required Map<String,
        List<ProdutoOpcaoModel>>
    opcoesAgrupadas,
  }) {

    double valor =
        produto.precoBase;

    for (var grupo
        in opcoesAgrupadas.entries) {

      for (var opcao
          in grupo.value) {

        if (opcoesSelecionadas[
                grupo.key] ==
            opcao.nome) {

          valor +=
              opcao.valorAdicional;
        }
      }
    }

    return valor;
  }

  // ==========================================
  // TOTAL
  // ==========================================

  static double calcularTotal({

    required double valorUnitario,

    required int quantidade,
  }) {

    return valorUnitario *
        quantidade;
  }
}