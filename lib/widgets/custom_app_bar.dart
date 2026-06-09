import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/carrinho_page.dart';
import 'package:flutter_application_1/screens/first_page.dart';
import '../screens/orders_page.dart';

class CustomAppBar extends StatelessWidget {
  final String paginaAtual;

  const CustomAppBar({super.key, required this.paginaAtual});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    final bool celular = largura < 700;
    final bool tablet = largura >= 600 && largura < 900;

    return Padding(
      padding: EdgeInsets.only(
        top: celular ? 20 : 40,
        left: celular ? 15 : 30,
        right: celular ? 15 : 30,
      ),
      child: Row(
        children: [
          // =====================================
          // LOGO
          // =====================================
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              "assets/logo.png",
              width: celular ? 50 : 65,
              height: celular ? 60 : 75,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: celular ? 10 : 18),

          // =====================================
          // TEXTO
          // =====================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "BEM-VINDO À",
                  style: TextStyle(
                    fontSize: celular
                        ? 9
                        : tablet
                        ? 10
                        : 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gráfica Pergaminho",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: celular
                          ? 18
                          : tablet
                          ? 22
                          : 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0B4D2B),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =====================================
          // MENU
          // =====================================
          Row(
            children: [
              // CATÁLOGO
              GestureDetector(
                onTap: () {
                  if (paginaAtual != "catalogo") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const FirstPage()),
                    );
                  }
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: celular
                      ? _menuIcone(
                          icon: Icons.grid_view_rounded,
                          ativo: paginaAtual == "catalogo",
                        )
                      : _menuItem(
                          titulo: "CATÁLOGO",
                          ativo: paginaAtual == "catalogo",
                          mobile: celular,
                          icon: Icons.grid_view_rounded,
                        ),
                ),
              ),

              SizedBox(width: celular ? 10 : 30),

              // PEDIDOS
              GestureDetector(
                onTap: () {
                  if (paginaAtual != "pedidos") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const OrdersPage()),
                    );
                  }
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: celular
                      ? _menuIcone(
                          icon: Icons.receipt_long_outlined,
                          ativo: paginaAtual == "pedidos",
                        )
                      : _menuItem(
                          titulo: "PEDIDOS",
                          ativo: paginaAtual == "pedidos",
                          mobile: celular,
                          icon: Icons.receipt_long_outlined,
                        ),
                ),
              ),

              SizedBox(width: celular ? 10 : 30),

              // =====================================
              // CARRINHO
              // =====================================
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CarrinhoPage()),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: celular ? 12 : 20,
                      vertical: celular ? 12 : 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B4D2B),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: celular ? 22 : 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required String titulo,
    required bool ativo,
    required bool mobile,
    IconData? icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 10 : 16,
        vertical: mobile ? 8 : 10,
      ),

      decoration: BoxDecoration(
        color: ativo
            ? const Color(0xFF0B4D2B).withOpacity(0.12)
            : Colors.transparent,

        borderRadius: BorderRadius.circular(12),
      ),

      child: mobile
          ? Icon(
              icon,
              size: 22,
              color: ativo ? const Color(0xFF0B4D2B) : Colors.black54,
            )
          : Text(
              titulo,
              style: TextStyle(
                color: ativo ? const Color(0xFF0B4D2B) : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  Widget _menuIcone({required IconData icon, bool ativo = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ativo
            ? const Color(0xFF0B4D2B).withValues(alpha: 0.10)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: ativo ? const Color(0xFF0B4D2B) : Colors.black54,
      ),
    );
  }
}
