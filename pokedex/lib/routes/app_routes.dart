import 'package:go_router/go_router.dart';
import '../feature/details/presentation/page/details_page.dart';
import '../feature/pokemons/presentation/page/pokemons_page.dart';
import '../feature/search/presentation/page/search_page.dart';

abstract class AppRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, __) => const PokemonsPage(),
        routes: [
          GoRoute(
            path: 'detais/:id',
            name: 'details',
            builder: (_, state) {
              late int id;
              try {
                id = int.parse(state.pathParameters['id'] ?? '1');
              } catch (_) {
                id = 1;
              }
              return DetailsPage(id: id);
            },
          ),
          GoRoute(
            path: 'search',
            name: 'search',
            builder: (_, __) => const SearchPage(),
          )
        ],
      ),
    ],
  );
}
