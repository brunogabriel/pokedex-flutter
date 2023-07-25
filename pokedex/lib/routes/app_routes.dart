import 'package:go_router/go_router.dart';
import 'package:pokedex/feature/details/presentation/page/details_page.dart';
import 'package:pokedex/feature/pokemons/presentation/page/pokemons_page.dart';
import 'package:pokedex/shared/data/pokemon.dart';

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
