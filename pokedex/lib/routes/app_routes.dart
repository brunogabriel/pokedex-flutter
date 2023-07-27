import 'package:go_router/go_router.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/details/presentation/page/details_page.dart';
import 'package:pokedex_flutter/feature/pokemons/presentation/page/pokemons_page.dart';

abstract class AppRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          name: 'home',
          builder: (_, __) => const PokemonsPage(),
          routes: [
            GoRoute(
              path: 'detais',
              name: 'details',
              builder: (_, state) {
                return DetailsPage(pokemon: state.extra as Pokemon);
              },
            )
          ])
    ],
  );
}
