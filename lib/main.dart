import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/catalog_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/my_list_screen.dart';
import 'screens/netflix_screen.dart';
import 'screens/profiles_screen.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Precarga las 3 fuentes para que la primera pantalla ya las muestre
  GoogleFonts.bebasNeue();
  GoogleFonts.poppins();
  GoogleFonts.robotoMono();
  await GoogleFonts.pendingFonts();
  runApp(const Lab09App());
}

class Lab09App extends StatelessWidget {
  const Lab09App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 09 - Netflix',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark, // Tema global
      initialRoute: '/',
      // Rutas con nombre
      routes: {
        '/': (context) => const ProfilesScreen(),
        '/home': (context) => const NetflixScreen(),
        '/series': (context) => const CatalogScreen(tipo: 'serie'),
        '/peliculas': (context) => const CatalogScreen(tipo: 'pelicula'),
        '/mi-lista': (context) => const MyListScreen(),
        '/detalle': (context) => const DetailScreen(),
      },
    );
  }
}
