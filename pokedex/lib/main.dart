import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_theme_data.dart';
import 'package:pokedex/di/injection.dart';
import 'package:pokedex/routes/app_routes.dart';

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
  const PokemonApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: PokedexThemeData.lightThemeData,
      //darkTheme: PokedexThemeData.darkThemeData,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}

/**
 * String get thumbnailUrl {
    if (number < 905) {
      return 'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/${number.toString().padLeft(3, '0')}.png';
    }

    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${number.toString()}.png';
  }
 */