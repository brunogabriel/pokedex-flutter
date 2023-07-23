import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/design/pokedex_spacing.dart';
import 'package:pokedex/feature/pokemons/presentation/bloc/pokemons_list_bloc.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemon_card.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_error_widget.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_loading_widget.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_strings.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonsWidget extends StatefulWidget {
  const PokemonsWidget({super.key});

  @override
  State<PokemonsWidget> createState() => _PokemonsWidgetState();
}

class _PokemonsWidgetState extends State<PokemonsWidget> {
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PokemonsListBloc, PokemonsListState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final status = state.status;

          if (state.firstPage) {
            if (status == Status.loading) {
              return const Center(child: PokemonsLoadingWidget());
            } else if (status == Status.failure) {
              return const Center(child: PokemonsErrorWidget());
            } else if (status == Status.initial) {
              return const SizedBox.shrink();
            }
          }

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        left: PokedexSpacing.kM, bottom: PokedexSpacing.kL),
                    child: Text(
                      'Pokédex',
                      style: textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  childCount: 1,
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: PokedexSpacing.kM),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: PokedexSpacing.kM,
                    crossAxisSpacing: PokedexSpacing.kM,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final pokemon = state.result[index];
                      return PokemonCard(
                        name: pokemon.name,
                        number: '#${pokemon.number.toString().padLeft(4, '0')}',
                        thumbnailUrl: pokemon.thumbnailUrl,
                        types: pokemon.types.map((e) => e.name).toList(),
                      );
                    },
                    childCount: state.result.length,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, __) {
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
                                Image.asset(
                                  'images/sleep_snorlax.png'.asset(),
                                  height: 150,
                                  width: 150,
                                ),
                                const SizedBox(
                                  width: PokedexSpacing.kS,
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        PokemonsStrings.errorPagination,
                                        style: textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: PokedexSpacing.kS),
                                      Text(
                                          PokemonsStrings
                                              .errorPaginationMessage,
                                          style: textTheme.bodyMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            FilledButton(
                                onPressed: () => context
                                    .read<PokemonsListBloc>()
                                    .add(PokemonsListRequestEvent()),
                                child: const Text(
                                    PokemonsStrings.errorPaginationTryAgain)),
                          ],
                        ),
                      );
                    } else {
                      tailWidget = const SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: PokedexSpacing.kXL),
                      child: tailWidget,
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onScrollListener() {
    final state = context.read<PokemonsListBloc>().state;
    if (_isBottomReached && state.status != Status.failure) {
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
    context.read<PokemonsListBloc>().add(PokemonsListRequestEvent());
  }
}
