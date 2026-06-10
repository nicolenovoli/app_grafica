import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),

      decoration: const BoxDecoration(color: Color(0xFF0B4D2B)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // TÍTULO
          const Text(
            "Gráfica Pergaminho",

            style: TextStyle(
              color: Colors.white,

              fontSize: 28,

              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Impressões profissionais para fortalecer sua marca.",

            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),

          const SizedBox(height: 28),

          // CONTATO
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.white),

              const SizedBox(width: 10),

              const Expanded(
                child: Text(
                  "Av. Dr. Alexandre Rasgulaeff,  2733 - Maringá/PR",

                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              const Icon(Icons.phone_outlined, color: Colors.white),

              const SizedBox(width: 10),

              const Text(
                "(44) 99946-6502",

                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              const Icon(Icons.email_outlined, color: Colors.white),

              const SizedBox(width: 10),

              const Text(
                "contato@graficapergaminho.com",

                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Divider(color: Colors.white.withValues(alpha: 0.2)),

          const SizedBox(height: 18),

          const Center(
            child: Text(
              "© 2026 Gráfica Pergaminho • Todos os direitos reservados",

              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
