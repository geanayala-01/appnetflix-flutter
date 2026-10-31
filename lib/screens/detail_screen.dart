import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../theme/app_theme.dart';
import '../widgets/section_row.dart';

/// Detalle de un título. Recibe argumentos por la ruta /detalle.
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Map<String, dynamic> p = args['pelicula'];
    final Color color = args['color'];
    final similares = peliculas
        .where((m) => m['titulo'] != p['titulo'])
        .take(8)
        .toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Image.network(
                backdrop(p['imagen']),
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xFF0B0B0F)],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text((p['titulo'] as String).toUpperCase(),
                    style: AppTheme.titulo(size: 40)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text('${p['anio']}', style: AppTheme.dato()),
                    const SizedBox(width: 12),
                    Text(p['duracion'], style: AppTheme.dato()),
                    const SizedBox(width: 12),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(' ${p['rating']}', style: AppTheme.dato(color: Colors.amber)),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white38),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text('HD', style: AppTheme.dato(size: 10)),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Reproducir'),
                  ),
                ),
                const SizedBox(height: 14),
                Text(descripcion(p), style: AppTheme.texto()),
                const SizedBox(height: 10),
                Chip(label: Text(p['genero'])),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _Accion(icono: Icons.add, texto: 'Mi lista'),
                    _Accion(icono: Icons.thumb_up_alt_outlined, texto: 'Calificar'),
                    _Accion(icono: Icons.share, texto: 'Compartir'),
                    _Accion(icono: Icons.download, texto: 'Descargar'),
                  ],
                ),
              ],
            ),
          ),
          SectionRow(titulo: 'Más títulos similares', items: similares, color: color),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Accion extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _Accion({required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono),
        const SizedBox(height: 4),
        Text(texto, style: AppTheme.dato(size: 11)),
      ],
    );
  }
}
