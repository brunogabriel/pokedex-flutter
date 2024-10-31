import 'package:flutter/material.dart';
import 'design/constants/pokedex_theme_data.dart';
import 'di/injection.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) => const PokemonApplication();
}

class PokemonApplication extends StatelessWidget {
  const PokemonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: PokedexThemeData.pokedexTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}
