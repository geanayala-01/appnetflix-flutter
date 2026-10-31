import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../theme/app_theme.dart';

/// Card con el póster (imagen en la nube). Al tocarla abre la ruta /detalle.
class MovieCard extends StatelessWidget {
  final Map<String, dynamic> pelicula;
  final Color color;
  final double width;
  final double height;
  final bool horizontal;
  final int? ranking;

  const MovieCard({
    super.key,
    required this.pelicula,
    required this.color,
    this.width = 120,
    this.height = 180,
    this.horizontal = false,
    this.ranking,
  });

  @override
  Widget build(BuildContext context) {
    final url = horizontal
        ? backdrop(pelicula['imagen'])
        : poster(pelicula['imagen']);

    final card = Card(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progreso) => progreso == null
                  ? child
                  : Container(
                      color: Colors.white10,
                      child: Center(
                        child: CircularProgressIndicator(color: color, strokeWidth: 2),
                      ),
                    ),
              errorBuilder: (context, error, stack) => Container(
                color: Colors.white10,
                child: const Icon(Icons.broken_image, color: Colors.white38),
              ),
            ),
            if (horizontal)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black87, Colors.transparent],
                    ),
                  ),
                  child: Text(pelicula['titulo'], style: AppTheme.titulo(size: 20)),
                ),
              ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/detalle',
        arguments: {'pelicula': pelicula, 'color': color},
      ),
      child: ranking == null
          ? card
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$ranking',
                  style: AppTheme.titulo(size: 90, color: Colors.white24),
                ),
                card,
              ],
            ),
    );
  }
}
