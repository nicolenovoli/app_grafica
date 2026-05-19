import '../models/item_pedido_model.dart';
import '../models/produto_model.dart';
import '../models/produto_opcao_model.dart';

class ProdutoService {

  // ==========================================
  // AGRUPAR OPÇÕES
  // ==========================================

  static Map<
      String,
      List<ProdutoOpcaoModel>
  > agruparOpcoes(
    ProdutoModel produto,
  ) {

    Map<
        String,
        List<ProdutoOpcaoModel>
    > opcoesAgrupadas = {};

    for (var opcao
        in produto.opcoes) {

      if (!opcoesAgrupadas.containsKey(
        opcao.grupo,
      )) {

        opcoesAgrupadas[
            opcao.grupo] = [];
      }

      opcoesAgrupadas[
          opcao.grupo]!.add(opcao);
    }

    return opcoesAgrupadas;
  }

  // ==========================================
  // OPÇÕES PADRÃO
  // ==========================================

  static Map<String, String>
      criarOpcoesPadrao(
    Map<
        String,
        List<ProdutoOpcaoModel>
    > opcoesAgrupadas,
  ) {

    Map<String, String>
        opcoesSelecionadas = {};

    opcoesAgrupadas.forEach(

      (grupo, listaOpcoes) {

        opcoesSelecionadas[grupo] =
            listaOpcoes.first.nome;
      },
    );

    return opcoesSelecionadas;
  }

  // ==========================================
  // CALCULAR VALOR UNITÁRIO
  // ==========================================

  static double calcularValorUnitario(

    ProdutoModel produto,

    Map<String, String>
        opcoesSelecionadas,

    Map<
        String,
        List<ProdutoOpcaoModel>
    > opcoesAgrupadas,
  ) {

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
  // CALCULAR TOTAL
  // ==========================================

  static double calcularTotal({

    required double valorUnitario,

    required int quantidade,
  }) {

    return valorUnitario *
        quantidade;
  }

  // ==========================================
  // CRIAR ITEM PEDIDO
  // ==========================================

  static ItemPedidoModel
      criarItemPedido({

    required ProdutoModel produto,

    required int quantidade,

    required double valorUnitario,

    required double subtotal,

    required Map<String, String>
        opcoesSelecionadas,
  }) {

    return ItemPedidoModel(

      produtoId: produto.id,

      nome: produto.nome,

      imagem: produto.imagem,

      quantidade: quantidade,

      valorUnitario:
          valorUnitario,

      subtotal: subtotal,

      observacoes:

          opcoesSelecionadas.entries

              .map(
                (e) =>
                    "${e.key}: ${e.value}",
              )

              .join(" | "),
    );
  }
}