import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/design/components/loading_page.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/feature/pokemons/presentation/bloc/pokemons_bloc.dart';
import 'package:pokedex_flutter/feature/pokemons/presentation/constants/pokemons_strings.dart';
import 'package:pokedex_flutter/feature/pokemons/presentation/strings/pokemons_strings.dart';
import 'package:pokedex_flutter/feature/pokemons/presentation/widgets/pokemon_card.dart';

class PokemonsSuccess extends StatefulWidget {
  const PokemonsSuccess({Key? key}) : super(key: key);

  @override
  State<PokemonsSuccess> createState() => _PokemonsSuccessState();
}

class _PokemonsSuccessState extends State<PokemonsSuccess> {
  final _scrollController = ScrollController();
  Color _textFieldColor = const Color(0xFFF2F2F2);

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
        snap: true,
        floating: true,
        pinned: true,
        scrolledUnderElevation: 0,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                PokemonStrings.subtitle,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: PokedexSpacing.kL),
              TextField(
                cursorColor: const Color(0xFFEA5D60),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  fillColor: _textFieldColor,
                  hintText: 'What Pokémon are you looking for? ',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                      left: PokedexSpacing.kM,
                      right: PokedexSpacing.kS,
                    ),
                    child: Icon(Icons.search),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: PokedexSpacing.kL,
                    vertical: 20.0,
                  ),
                ),
                onChanged: (value) {},
                onSubmitted: (value) {},
                onTap: () {
                  setState(() {
                    _textFieldColor = const Color(0xFFE2E2E2);
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    _textFieldColor = const Color(0xFFF2F2F2);
                  });
                },
              ),
              const SizedBox(height: PokedexSpacing.kS),
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: PokedexSpacing.kL),
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
            final Widget tailWidget;
            if (!state.firstPage && status == Status.loading) {
              tailWidget = const Padding(
                padding: EdgeInsets.all(PokedexSpacing.kM),
                child: LoadingPage(),
              );
            } else if (!state.firstPage && status == Status.failure) {
              tailWidget = Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: PokedexSpacing.kM, horizontal: PokedexSpacing.kL),
                child: Column(
                  children: [
                    Text(
                      PokemonsStrings.paginationErrorTitle,
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: PokedexSpacing.kM),
                    Text(
                      PokemonsStrings.paginationError,
                      style: textTheme.bodyMedium?.copyWith(),
                    ),
                    const SizedBox(height: PokedexSpacing.kL),
                    FilledButton(
                      onPressed: () => context
                          .read<PokemonsBloc>()
                          .add(PokemonsRequestEvent()),
                      child: const Text(PokemonsStrings.tryAgain),
                    ),
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
