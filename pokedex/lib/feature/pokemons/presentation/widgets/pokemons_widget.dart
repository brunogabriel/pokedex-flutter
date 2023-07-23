import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/design/pokedex_spacing.dart';
import 'package:pokedex/feature/pokemons/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemon_card.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_error_widget.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_loading_widget.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PokemonListCubit, PokemonListState>(
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
                  (context, index) => const Text('Pokédex'),
                  childCount: 1,
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: PokedexSpacing.kM),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final pokemon = state.result[index];
                      return PokemonCard(
                        name: pokemon.name,
                        number: '#${pokemon.number.toString().padLeft(4, '0')}',
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
                      tailWidget = const SizedBox(
                          width: 64,
                          height: 64,
                          child: CircularProgressIndicator());
                    } else if (!state.firstPage && status == Status.failure) {
                      tailWidget = const Text('Error try again');
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
    final state = context.read<PokemonListCubit>().state;
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
    context.read<PokemonListCubit>().requestPokemons();
  }
}
