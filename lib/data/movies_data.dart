import 'package:flutter/material.dart';

// Imágenes en la nube (picsum genera una imagen fija por cada "seed")
String poster(String seed) => 'https://picsum.photos/seed/$seed/300/450';
String backdrop(String seed) => 'https://picsum.photos/seed/$seed/800/450';

const rojoNetflix = Color(0xFFE50914);

/// Perfiles de usuario: List de Maps.
final List<Map<String, dynamic>> perfiles = [
  {'nombre': 'Gean', 'color': const Color(0xFFE50914), 'icono': Icons.sentiment_very_satisfied},
  {'nombre': 'Familia', 'color': const Color(0xFF2E7DFF), 'icono': Icons.family_restroom},
  {'nombre': 'Invitado', 'color': const Color(0xFFF5B400), 'icono': Icons.person},
  {'nombre': 'Niños', 'color': const Color(0xFF00B37E), 'icono': Icons.child_care},
];

/// Catálogo de películas y series: List de Maps.
final List<Map<String, dynamic>> peliculas = [
  {'titulo': 'Sombras del Norte', 'tipo': 'pelicula', 'genero': 'Thriller', 'anio': 2024, 'rating': 8.1, 'duracion': '2h 05m', 'imagen': 'sombras'},
  {'titulo': 'Código Andino', 'tipo': 'pelicula', 'genero': 'Acción', 'anio': 2023, 'rating': 7.6, 'duracion': '1h 52m', 'imagen': 'andino'},
  {'titulo': 'La Última Estación', 'tipo': 'pelicula', 'genero': 'Drama', 'anio': 2022, 'rating': 8.4, 'duracion': '2h 18m', 'imagen': 'estacion'},
  {'titulo': 'Galaxia Rota', 'tipo': 'pelicula', 'genero': 'Ciencia ficción', 'anio': 2025, 'rating': 7.9, 'duracion': '2h 10m', 'imagen': 'galaxia'},
  {'titulo': 'Risas en Lima', 'tipo': 'pelicula', 'genero': 'Comedia', 'anio': 2024, 'rating': 7.2, 'duracion': '1h 38m', 'imagen': 'lima'},
  {'titulo': 'El Reino Perdido', 'tipo': 'pelicula', 'genero': 'Aventura', 'anio': 2021, 'rating': 8.0, 'duracion': '2h 01m', 'imagen': 'reino'},
  {'titulo': 'Noche Eterna', 'tipo': 'pelicula', 'genero': 'Terror', 'anio': 2023, 'rating': 6.9, 'duracion': '1h 45m', 'imagen': 'noche'},
  {'titulo': 'Pequeños Héroes', 'tipo': 'pelicula', 'genero': 'Animación', 'anio': 2025, 'rating': 8.3, 'duracion': '1h 35m', 'imagen': 'heroes'},
  {'titulo': 'Mar de Fondo', 'tipo': 'pelicula', 'genero': 'Drama', 'anio': 2020, 'rating': 7.8, 'duracion': '1h 59m', 'imagen': 'mar'},
  {'titulo': 'Velocidad Cero', 'tipo': 'pelicula', 'genero': 'Acción', 'anio': 2024, 'rating': 7.4, 'duracion': '2h 03m', 'imagen': 'velocidad'},
  {'titulo': 'Amor en Cusco', 'tipo': 'pelicula', 'genero': 'Comedia', 'anio': 2024, 'rating': 7.0, 'duracion': '1h 42m', 'imagen': 'cusco'},
  {'titulo': 'La Bóveda', 'tipo': 'pelicula', 'genero': 'Acción', 'anio': 2025, 'rating': 7.5, 'duracion': '2h 07m', 'imagen': 'boveda'},
  {'titulo': 'El Detective', 'tipo': 'serie', 'genero': 'Thriller', 'anio': 2025, 'rating': 8.2, 'duracion': '3 temporadas', 'imagen': 'detective'},
  {'titulo': 'Corona de Hierro', 'tipo': 'serie', 'genero': 'Drama', 'anio': 2023, 'rating': 8.7, 'duracion': '2 temporadas', 'imagen': 'corona'},
  {'titulo': 'Planeta Azul', 'tipo': 'serie', 'genero': 'Documental', 'anio': 2022, 'rating': 8.9, 'duracion': '1 temporada', 'imagen': 'planeta'},
  {'titulo': 'Robots del Sur', 'tipo': 'serie', 'genero': 'Animación', 'anio': 2021, 'rating': 7.7, 'duracion': '4 temporadas', 'imagen': 'robots'},
  {'titulo': 'Barrio Alto', 'tipo': 'serie', 'genero': 'Drama', 'anio': 2024, 'rating': 8.0, 'duracion': '2 temporadas', 'imagen': 'barrio'},
  {'titulo': 'Papel y Tinta', 'tipo': 'serie', 'genero': 'Comedia', 'anio': 2023, 'rating': 7.3, 'duracion': '1 temporada', 'imagen': 'tinta'},
  {'titulo': 'Frontera', 'tipo': 'serie', 'genero': 'Thriller', 'anio': 2025, 'rating': 8.4, 'duracion': '1 temporada', 'imagen': 'frontera'},
  {'titulo': 'Los Inmortales', 'tipo': 'serie', 'genero': 'Ciencia ficción', 'anio': 2022, 'rating': 7.9, 'duracion': '3 temporadas', 'imagen': 'inmortales'},
];

/// "Mi lista" del usuario (se puede agregar o quitar títulos).
final List<Map<String, dynamic>> miLista = [peliculas[13], peliculas[2], peliculas[7]];

/// Devuelve [cantidad] títulos empezando en [inicio] (da la vuelta al final).
List<Map<String, dynamic>> seleccion(int inicio, int cantidad) => List.generate(
    cantidad, (i) => peliculas[(inicio + i) % peliculas.length]);

/// Filtra por tipo ('pelicula' o 'serie').
List<Map<String, dynamic>> porTipo(String tipo) =>
    peliculas.where((p) => p['tipo'] == tipo).toList();

/// Agrupa una lista por género (un `Map` de género a lista de títulos).
Map<String, List<Map<String, dynamic>>> agruparPorGenero(
    List<Map<String, dynamic>> lista) {
  final Map<String, List<Map<String, dynamic>>> grupos = {};
  for (final p in lista) {
    grupos.putIfAbsent(p['genero'], () => []).add(p);
  }
  return grupos;
}

String descripcion(Map<String, dynamic> p) =>
    '${p['titulo']} es una ${p['tipo'] == 'serie' ? 'serie' : 'película'} de '
    '${(p['genero'] as String).toLowerCase()} que sigue a un grupo de personajes '
    'enfrentando decisiones que cambiarán su destino. Estrenada en ${p['anio']}, '
    'se convirtió en una de las más vistas de NETFLIX.';
