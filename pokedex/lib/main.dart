import 'package:flutter/material.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/onboarding/presentation/page/onboarding_page.dart';
import 'package:pokedex/pokemon/presentation/page/pokemon_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingPage(),
        '/pokemons': (context) => const PokemonPage()
      },
    );
  }
}
