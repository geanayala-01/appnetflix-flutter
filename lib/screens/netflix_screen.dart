import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../theme/app_theme.dart';
import '../widgets/hero_banner.dart';
import '../widgets/netflix_bottom_bar.dart';
import '../widgets/section_row.dart';

/// Inicio de Netflix: banner, accesos rápidos, carruseles y Top 10.
class NetflixScreen extends StatelessWidget {
  const NetflixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        automaticallyImplyLeading: false,
        title: Text('NETFLIX', style: AppTheme.titulo(size: 34, color: rojoNetflix)),
        actions: [
          const Icon(Icons.search),
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Cambiar perfil',
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      bottomNavigationBar: const NetflixBottomBar(actual: 0),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          HeroBanner(
            imagen: 'assets/images/banner_flix.png',
            etiqueta: 'N° 1 EN PERÚ HOY',
            titulo: 'SOMBRAS DEL NORTE',
            subtitulo: 'Thriller · Suspenso · Misterio',
            color: rojoNetflix,
            pelicula: peliculas[0],
            alto: 460,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                _chip(context, 'Series', '/series'),
                _chip(context, 'Películas', '/peliculas'),
                _chip(context, 'Mi lista', '/mi-lista'),
              ],
            ),
          ),
          SectionRow(titulo: 'Tendencias ahora', items: seleccion(1, 8), color: rojoNetflix),
          SectionRow(
              titulo: 'Top 10 en Perú hoy',
              items: seleccion(4, 10),
              color: rojoNetflix,
              ranking: true),
          SectionRow(
              titulo: 'Series aclamadas',
              items: porTipo('serie'),
              color: rojoNetflix,
              horizontal: true),
          SectionRow(
              titulo: 'Porque viste Código Andino',
              items: seleccion(9, 8),
              color: rojoNetflix),
          SectionRow(
              titulo: 'Volver a ver', items: miLista, color: rojoNetflix),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _chip(BuildContext context, String texto, String ruta) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ActionChip(
          label: Text(texto),
          backgroundColor: Colors.black,
          side: const BorderSide(color: Colors.white38),
          onPressed: () => Navigator.pushReplacementNamed(context, ruta),
        ),
      );
}
