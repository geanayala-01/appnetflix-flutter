import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../theme/app_theme.dart';
import '../widgets/hero_banner.dart';
import '../widgets/netflix_bottom_bar.dart';
import '../widgets/section_row.dart';

/// Catálogo de Series o Películas, con una fila por género.
/// Se usa en las rutas /series y /peliculas.
class CatalogScreen extends StatelessWidget {
  final String tipo; // 'serie' o 'pelicula'

  const CatalogScreen({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final esSerie = tipo == 'serie';
    final lista = porTipo(tipo);
    final grupos = agruparPorGenero(lista); // Map de género -> lista

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(esSerie ? 'SERIES' : 'PELÍCULAS'),
        actions: const [Icon(Icons.search), SizedBox(width: 16)],
      ),
      bottomNavigationBar: NetflixBottomBar(actual: esSerie ? 1 : 2),
      body: ListView(
        children: [
          HeroBanner(
            imagen: esSerie
                ? 'assets/images/banner_series.png'
                : 'assets/images/banner_peliculas.png',
            etiqueta: esSerie ? 'SERIE NETFLIX' : 'PELÍCULA NETFLIX',
            titulo: (lista.first['titulo'] as String).toUpperCase(),
            subtitulo: '${lista.first['genero']} · ${lista.first['duracion']}',
            color: rojoNetflix,
            pelicula: lista.first,
            alto: 320,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              '${lista.length} títulos en ${grupos.length} géneros',
              style: AppTheme.dato(),
            ),
          ),
          ...grupos.entries.map((g) => SectionRow(
                titulo: g.key,
                items: g.value,
                color: rojoNetflix,
                horizontal: esSerie,
              )),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
