import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../theme/app_theme.dart';

/// Pantalla inicial "¿Quién está viendo?" con los perfiles (Cards).
class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset('assets/images/home_bg.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Center(
                  child: Text('NETFLIX',
                      style: AppTheme.titulo(size: 56, color: rojoNetflix)),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text('¿Quién está viendo?',
                      style: AppTheme.texto(size: 22, color: Colors.white)),
                ),
                const SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: perfiles.map((p) => _PerfilCard(perfil: p)).toList(),
                ),
                const SizedBox(height: 30),
                Card(
                  color: Colors.white10,
                  child: ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Administrar perfiles'),
                    subtitle: Text('${perfiles.length} perfiles', style: AppTheme.dato()),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PerfilCard extends StatelessWidget {
  final Map<String, dynamic> perfil;

  const _PerfilCard({required this.perfil});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, '/home'),
      child: Column(
        children: [
          Card(
            color: perfil['color'],
            child: SizedBox(
              width: 110,
              height: 110,
              child: Icon(perfil['icono'], size: 60, color: Colors.white),
            ),
          ),
          const SizedBox(height: 6),
          Text(perfil['nombre'], style: AppTheme.texto(color: Colors.white)),
        ],
      ),
    );
  }
}
