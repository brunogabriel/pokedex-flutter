import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/feature/pokemons/presentation/bloc/pokemons_bloc.dart';
import 'package:pokedex/feature/pokemons/presentation/constants/pokemons_strings.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemon_card.dart';

class PokemonsSuccess extends StatefulWidget {
  const PokemonsSuccess({Key? key}) : super(key: key);

  @override
  State<PokemonsSuccess> createState() => _PokemonsSuccessState();
}

class _PokemonsSuccessState extends State<PokemonsSuccess> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PokemonsBloc>().state;
    final status = state.status;
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
        pinned: true,
        scrolledUnderElevation: 0,
        floating: true,
        expandedHeight: 120.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding:
              const EdgeInsets.symmetric(horizontal: PokedexSpacing.kL),
          title: Text(
            PokemonStrings.title,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PokedexSpacing.kL,
            vertical: PokedexSpacing.kS,
          ),
          child: Text(
            PokemonStrings.subtitle,
            style: textTheme.bodyMedium,
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: PokedexSpacing.kM),
        sliver: SliverList.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: PokedexSpacing.kM,
          ),
          itemBuilder: (context, index) {
            final pokemon = state.result[index];
            return PokemonCard(pokemon: pokemon);
          },
          itemCount: state.result.length,
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, __) {
            // TODO: improvements
            final Widget tailWidget;
            if (!state.firstPage && status == Status.loading) {
              tailWidget = const Padding(
                padding: EdgeInsets.all(PokedexSpacing.kM),
                child: Center(
                  child: SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator()),
                ),
              );
            } else if (!state.firstPage && status == Status.failure) {
              tailWidget = Padding(
                padding: const EdgeInsets.all(PokedexSpacing.kM),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                'Error pagination',
                                style: textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: PokedexSpacing.kS),
                              Text('pagination error message',
                                  style: textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FilledButton(
                        onPressed: () => context
                            .read<PokemonsBloc>()
                            .add(PokemonsRequestEvent()),
                        child: const Text('Try again,')),
                  ],
                ),
              );
            } else {
              tailWidget = const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: PokedexSpacing.kXL),
              child: tailWidget,
            );
          },
          childCount: 1,
        ),
      )
    ]);
  }

  void _onScrollListener() {
    // final state = context.read<PokemonsBloc>().state;
    // if (_isBottomReached && state.status != Status.failure) {
    //   _requestPokemons();
    // }

    if (_isBottomReached) {
      _requestPokemons();
    }
  }

  bool get _isBottomReached {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _requestPokemons() {
    context.read<PokemonsBloc>().add(PokemonsRequestEvent());
  }
}
