import 'package:flutter/material.dart';

class ProdutoDestaque extends StatelessWidget {
  const ProdutoDestaque({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          image: const DecorationImage(
            image: AssetImage("assets/placeholder.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.white.withValues(alpha: 0.7),
              ],
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B4D2B),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'MAIS VENDIDO',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Cartões de Visita',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Impressão profissional, papel premium',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}