import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Banner principal con imagen LOCAL (Image.asset), textos y botones.
class HeroBanner extends StatelessWidget {
  final String imagen;
  final String etiqueta;
  final String titulo;
  final String subtitulo;
  final Color color;
  final Map<String, dynamic> pelicula;
  final double alto;

  const HeroBanner({
    super.key,
    required this.imagen,
    required this.etiqueta,
    required this.titulo,
    required this.subtitulo,
    required this.color,
    required this.pelicula,
    this.alto = 380,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: alto,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagen, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(etiqueta, style: AppTheme.dato(size: 11, color: Colors.white)),
                ),
                const SizedBox(height: 8),
                Text(titulo, style: Theme.of(context).textTheme.headlineLarge),
                Text(subtitulo, style: AppTheme.texto(size: 13)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/detalle',
                        arguments: {'pelicula': pelicula, 'color': color},
                      ),
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Reproducir'),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white54),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Mi lista'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
