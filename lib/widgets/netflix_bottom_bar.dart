import 'package:flutter/material.dart';

import '../data/movies_data.dart';

/// Barra inferior compartida. Cada opción navega a una ruta con nombre.
class NetflixBottomBar extends StatelessWidget {
  final int actual;

  const NetflixBottomBar({super.key, required this.actual});

  // Lista de Maps con las opciones del menú
  static const List<Map<String, dynamic>> opciones = [
    {'texto': 'Inicio', 'icono': Icons.home, 'ruta': '/home'},
    {'texto': 'Series', 'icono': Icons.tv, 'ruta': '/series'},
    {'texto': 'Películas', 'icono': Icons.movie, 'ruta': '/peliculas'},
    {'texto': 'Mi lista', 'icono': Icons.playlist_add_check, 'ruta': '/mi-lista'},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: actual,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF121212),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      onTap: (i) {
        if (i != actual) {
          Navigator.pushReplacementNamed(context, opciones[i]['ruta']);
        }
      },
      items: opciones
          .map((o) => BottomNavigationBarItem(
                icon: Icon(o['icono']),
                activeIcon: Icon(o['icono'], color: rojoNetflix),
                label: o['texto'],
              ))
          .toList(),
    );
  }
}
