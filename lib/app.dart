import 'package:flutter/material.dart';
import 'package:hijos_de_los_heroes_app/config/routes/app_routes.dart';
import 'package:hijos_de_los_heroes_app/core/theme/app_theme.dart';

class HijosDeLosHeroesApp extends StatelessWidget {
  const HijosDeLosHeroesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hijos de los Héroes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

