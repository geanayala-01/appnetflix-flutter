import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tema global de la app.
/// Se usan 3 tipos de letra:
///  - Bebas Neue  -> títulos y logos
///  - Poppins     -> texto general
///  - Roboto Mono -> datos (año, duración, rating)
class AppTheme {
  static TextStyle titulo({double size = 28, Color color = Colors.white}) =>
      GoogleFonts.bebasNeue(fontSize: size, color: color, letterSpacing: 1.2);

  static TextStyle texto({double size = 14, Color color = Colors.white70}) =>
      GoogleFonts.poppins(fontSize: size, color: color);

  static TextStyle dato({double size = 12, Color color = Colors.white70}) =>
      GoogleFonts.robotoMono(fontSize: size, color: color);

  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF0B0B0F),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFE50914),
        secondary: Color(0xFF00A8E1),
        surface: Color(0xFF16161D),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).copyWith(
        headlineLarge: GoogleFonts.bebasNeue(fontSize: 42, color: Colors.white),
        titleLarge: GoogleFonts.bebasNeue(
            fontSize: 24, color: Colors.white, letterSpacing: 1),
        labelSmall: GoogleFonts.robotoMono(fontSize: 11, color: Colors.white70),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.bebasNeue(fontSize: 32, color: Colors.white),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF16161D),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white70,
        textColor: Colors.white,
      ),
    );
  }
}
