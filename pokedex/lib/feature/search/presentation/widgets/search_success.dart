import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/feature/search/presentation/cubit/search_cubit.dart';
import 'package:pokedex_flutter/feature/search/presentation/widgets/search_pokemon_delegate.dart';

class SearchSuccess extends StatefulWidget {
  const SearchSuccess({super.key});

  @override
  State<SearchSuccess> createState() => _SearchSuccessState();
}

class _SearchSuccessState extends State<SearchSuccess> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final resources =
          (context.read<SearchCubit>().state as SearchSuccessState).result;
      showSearch(
        context: context,
        delegate: SearchPokemonDelegate(
          resources,
        ),
      );
    });
    // _showSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
