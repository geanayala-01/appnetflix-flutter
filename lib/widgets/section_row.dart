import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'movie_card.dart';

/// Sección con título + ListView horizontal de Cards.
class SectionRow extends StatelessWidget {
  final String titulo;
  final List<Map<String, dynamic>> items;
  final Color color;
  final bool horizontal;
  final bool ranking;

  const SectionRow({
    super.key,
    required this.titulo,
    required this.items,
    required this.color,
    this.horizontal = false,
    this.ranking = false,
  });

  @override
  Widget build(BuildContext context) {
    final double w = horizontal ? 260 : 120;
    final double h = horizontal ? 146 : 180;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 6),
          child: Row(
            children: [
              Expanded(
                child: Text(titulo, style: Theme.of(context).textTheme.titleLarge),
              ),
              Text('Ver todo', style: AppTheme.dato(color: color)),
            ],
          ),
        ),
        SizedBox(
          height: h + 8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length,
            itemBuilder: (context, i) => MovieCard(
              pelicula: items[i],
              color: color,
              width: w,
              height: h,
              horizontal: horizontal,
              ranking: ranking ? i + 1 : null,
            ),
          ),
        ),
      ],
    );
  }
}
