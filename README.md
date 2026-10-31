# Lab 09 – Netflix (Flutter)

App móvil con el diseño de Netflix: selección de perfil, inicio, series, películas, mi lista y detalle.

## Pantallas y rutas
| Ruta | Pantalla |
|---|---|
| `/` | `profiles_screen.dart` – ¿Quién está viendo? |
| `/home` | `netflix_screen.dart` – Inicio (banner, Top 10, carruseles) |
| `/series` y `/peliculas` | `catalog_screen.dart` – catálogo agrupado por género |
| `/mi-lista` | `my_list_screen.dart` – agregar / quitar títulos |
| `/detalle` | `detail_screen.dart` – recibe la película como argumento |

## Temas aplicados
| Tema | Dónde |
|---|---|
| ListView / ListView.builder | Todas las pantallas (vertical), carruseles horizontales (`widgets/section_row.dart`), Mi lista |
| ListTile | Mi lista, "Administrar perfiles" |
| Listas y Mapas | `data/movies_data.dart` (`List<Map<String, dynamic>>`, `agruparPorGenero` devuelve un `Map`) |
| Rutas | Rutas con nombre en `main.dart`, barra inferior (`widgets/netflix_bottom_bar.dart`), argumentos en `/detalle` |
| Tema global | `theme/app_theme.dart` (ThemeData oscuro, textTheme, cardTheme, appBarTheme) |
| Cards | Pósters (`widgets/movie_card.dart`), perfiles, Mi lista |
| Rows / Columns | Banner, botones, datos del detalle, Top 10 |
| 3 tipos de letra | Bebas Neue (títulos), Poppins (texto), Roboto Mono (datos) vía `google_fonts` |
| Imágenes locales | `assets/images/` con `Image.asset` (banners y fondo de perfiles) |
| Imágenes en la nube | Pósters con `Image.network` (picsum.photos) |

## Ejecutar
```bash
flutter pub get
flutter run
```
