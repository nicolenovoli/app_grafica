import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cart_page.dart';

import '../screens/orders_page.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 20,
      ),

      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF0B4D2B),
        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),  
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,

        children: [

          // INÍCIO
          _BottomItem(
            icon: Icons.home_outlined,
            label: 'INÍCIO',
            ativo: true,

            onTap: () {},
          ),

          // PEDIDOS
          _BottomItem(
            icon: Icons.assignment_outlined,
            label: 'PEDIDOS',
            ativo: false,

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const OrdersPage(),
                ),
              );

            },
          ),

          // CARRINHO
          _BottomItem(
            icon: Icons.shopping_bag_outlined,
            label: 'CARRINHO',
            ativo: false,

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const CartPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {

  final IconData icon;
  final String label;
  final bool ativo;
  final VoidCallback onTap;

  const _BottomItem({
    required this.icon,
    required this.label,
    required this.ativo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [

          Icon(
            icon,
              color: Colors.white,
  size: 24,
),

const SizedBox(height: 4),

Text(
  label,

  style: const TextStyle(
    color: Colors.white,

              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}