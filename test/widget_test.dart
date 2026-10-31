import 'package:flutter_test/flutter_test.dart';
import 'package:lab09/data/movies_data.dart';

void main() {
  test('El catálogo tiene películas y series agrupadas por género', () {
    expect(porTipo('pelicula'), isNotEmpty);
    expect(porTipo('serie'), isNotEmpty);
    final grupos = agruparPorGenero(porTipo('serie'));
    expect(grupos.values.expand((l) => l).length, porTipo('serie').length);
    expect(seleccion(19, 3).length, 3);
  });
}
