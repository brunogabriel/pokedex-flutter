import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/feature/pokemons/presentation/bloc/pokemons_bloc.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_failure.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_loading.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_success.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (providerContext) =>
          GetIt.I.get<PokemonsBloc>()..add(PokemonsRequestEvent()),
      child: Scaffold(
        body: BlocBuilder<PokemonsBloc, PokemonsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final status = state.status;
            if (state.firstPage) {
              if (status == Status.loading) {
                return const Center(child: PokemonsLoading());
              } else if (status == Status.failure) {
                return const Center(child: PokemonsFailure());
              } else if (status == Status.initial) {
                return const SizedBox.shrink();
              }
            }
            return const PokemonsSuccess();
          },
        ),
      ),
    );
  }
}



// class PokemonsPage extends StatelessWidget {
//   const PokemonsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//         body: CustomScrollView(
//       slivers: [
//         // TODO: Maybe move to succ
//         SliverAppBar(
//           pinned: true,
//           scrolledUnderElevation: 0,
//           floating: true,
//           expandedHeight: 120.0,
//           flexibleSpace: FlexibleSpaceBar(
//             centerTitle: false,
//             titlePadding:
//                 const EdgeInsets.symmetric(horizontal: PokedexSpacing.kL),
//             title: Text(
//               PokemonStrings.title,
//               style: textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: PokedexSpacing.kL,
//               vertical: PokedexSpacing.kS,
//             ),
//             child: Text(
//               PokemonStrings.subtitle,
//               style: textTheme.bodyMedium,
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (BuildContext context, int index) {
//               return Container(
//                 color: index.isOdd ? Colors.white : Colors.black12,
//                 height: 100.0,
//                 child: Center(
//                   child: Text('$index', textScaleFactor: 5),
//                 ),
//               );
//             },
//             childCount: 20,
//           ),
//         ),
//       ],
//     ));
//   }
// }
