import 'package:flutter/material.dart';
import 'package:hijos_de_los_heroes_app/modules/home/views/home_view.dart';
// Importa las demás vistas aquí cuando estén listas

class AppRoutes {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      // Aquí irán los módulos futuros. Ejemplo:
      // case memoriaHistorica:
      //   return MaterialPageRoute(builder: (_) => const MemoriaHistoricaView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
