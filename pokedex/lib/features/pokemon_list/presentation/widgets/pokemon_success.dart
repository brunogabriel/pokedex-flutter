import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../design/base/spacing.dart';
import '../bloc/pokemon_list_bloc.dart';
import 'pokemon_card.dart';

class PokemonSuccess extends StatefulWidget {
  const PokemonSuccess({super.key});

  @override
  State<PokemonSuccess> createState() => _PokemonSuccessState();
}

class _PokemonSuccessState extends State<PokemonSuccess> {
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
    final state = context.watch<PokemonListBloc>().state;
    final pageStatus = state.pageStatus;

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const SliverAppBar(
          snap: true,
          floating: true,
          pinned: true,
          scrolledUnderElevation: 0,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsets.symmetric(horizontal: Spacing.kL),
            title: Text('Pokedex title'),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.kL),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: Spacing.kM,
            ),
            itemBuilder: (context, index) {
              final pokemon = state.result[index];
              return PokemonCard(
                name: pokemon.name,
              );
            },
            itemCount: state.result.length,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, __) {
              final Widget tailWidget;
              if (!state.firstPage && pageStatus == PageStatus.loading) {
                tailWidget = const Padding(
                    padding: EdgeInsets.all(Spacing.kM),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
              } else if (!state.firstPage && pageStatus == PageStatus.failure) {
                tailWidget = const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Spacing.kM, horizontal: Spacing.kL),
                  child: Column(
                    children: [
                      Text('Error title'),
                    ],
                  ),
                );
              } else {
                tailWidget = const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: Spacing.kXL),
                child: tailWidget,
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }

  void _onScrollListener() {
    if (_isBottomReached) {
      context.read<PokemonListBloc>().add(const PokemonListEventRequest());
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
