import 'package:go_router/go_router.dart';
import 'package:pokedex/feature/pokemons/presentation/page/pokemons_page.dart';

abstract class AppRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const PokemonsPage(),
      )
    ],
  );
}
