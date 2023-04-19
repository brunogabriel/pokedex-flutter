import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex/home/presentation/widgets/pokemon_card_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state.result == ResultState.initial ||
                state.result == ResultState.loading && state.isFirstPage) ...{
              const Center(
                child: CircularProgressIndicator(),
              )
            } else if (state.result == ResultState.error &&
                state.isFirstPage) ...{
              Center(
                child: Text('Deu erro'),
              )
            } else ...{
              ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index < state.pokemons.length) {
                    return PokemonCardWidget(
                      name: state.pokemons[index].name,
                      sprite: state.pokemons[index].spriteUrl,
                      //response: state.characters[index],
                      // onTap: () {
                      //   context.goNamed(
                      //     'details',
                      //     params: {
                      //       'id': state.characters[index].id.toString(),
                      //     },
                      //   );
                      // },
                    );
                  } else if (state.result == ResultState.error) {
                    return Text('Deu erro de novo');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
                itemCount: state.hasReachedMax
                    ? state.pokemons.length
                    : state.pokemons.length + 1,
              )
            }
          ],
        );
      },
    );
  }

  void _requestPokemons() {
    context.read<HomeBloc>().add(HomeRequestEvent());
  }

  void _onScrollListener() {
    if (_isBottomReached &&
        context.read<HomeBloc>().state.result != ResultState.error) {
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
}
