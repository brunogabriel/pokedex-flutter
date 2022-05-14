import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/pokemon/data/service/pokemon_service.dart';
import 'package:pokedex/pokemon/domain/interactor/pokemon_interactor.dart';

import '../../../shared/widgets/pokemon_widget.dart';
import '../../domain/model/pokemon.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late PagingController<int, Pokemon> _pagingController;
  late IPokemonInteractor _interactor;

  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 0);
    _interactor = GetIt.I.get();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _interactor.takePokemons(pageKey);
      final isLastPage = newItems.length < IPokemonService.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageSize = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageSize);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      title: 'Pokemon Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pokémons'),
        ),
        body: _buildPokemonGrid(),
      ),
    );
  }

  Widget _buildPokemonGrid() {
    return PagedGridView<int, Pokemon>(
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      pagingController: _pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
        itemBuilder: (context, item, index) => PokemonWidget(
          name: item.name,
          number: item.number.toString(),
          thumbnail: item.thumbnail,
        ),
      ),
    );
  }
}
