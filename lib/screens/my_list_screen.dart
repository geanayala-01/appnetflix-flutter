import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../theme/app_theme.dart';
import '../widgets/netflix_bottom_bar.dart';

/// "Mi lista": ListView.builder de Cards con ListTile. Permite quitar títulos.
class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  void _agregar() {
    final disponibles = peliculas.where((p) => !miLista.contains(p)).toList();
    if (disponibles.isEmpty) return;
    setState(() => miLista.add(disponibles.first));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text('MI LISTA'),
      ),
      bottomNavigationBar: const NetflixBottomBar(actual: 3),
      floatingActionButton: FloatingActionButton(
        backgroundColor: rojoNetflix,
        foregroundColor: Colors.white,
        onPressed: _agregar,
        child: const Icon(Icons.add),
      ),
      body: miLista.isEmpty
          ? Center(child: Text('Tu lista está vacía', style: AppTheme.texto()))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: miLista.length,
              itemBuilder: (context, i) {
                final p = miLista[i];
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(poster(p['imagen']),
                          width: 50, height: 75, fit: BoxFit.cover),
                    ),
                    title: Text(p['titulo'], style: AppTheme.titulo(size: 22)),
                    subtitle: Row(
                      children: [
                        Text('${p['anio']} · ${p['duracion']}  ', style: AppTheme.dato()),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        Text(' ${p['rating']}', style: AppTheme.dato(color: Colors.amber)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Quitar de mi lista',
                      onPressed: () => setState(() => miLista.removeAt(i)),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/detalle',
                        arguments: {'pelicula': p, 'color': rojoNetflix}),
                  ),
                );
              },
            ),
    );
  }
}
