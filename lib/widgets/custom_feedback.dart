import 'package:flutter/material.dart';

class CustomFeedback {
  static void show({
    required BuildContext context,
    required String titulo,
    String? subtitulo,

    IconData icon = Icons.check,
    Color iconColor = Colors.white,
    Color iconBackgroundColor = const Color(0xFF0B4D2B),

    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,

        behavior: SnackBarBehavior.floating,

        margin: EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height - 140,
        ),

        backgroundColor: Colors.white,

        elevation: 4,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        content: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFF0B4D2B),

              child: Icon(
                icon, // <-- usar o parâmetro
                color: Colors.white,
                size: 18,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    titulo,

                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  if (subtitulo != null) ...[
                    const SizedBox(height: 4),

                    Text(
                      subtitulo,

                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
