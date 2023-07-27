import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/feature/about/presentation/page/about_page.dart';
import 'package:pokedex/feature/details/presentation/page/details_header.dart';
import 'package:pokedex/feature/evolution/presentation/page/evolution_page.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/pokemon_type_extensions.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: widget.pokemon.types.first.color.secundary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            DetailsHeader(
              pokemon: widget.pokemon,
            ),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'About'),
                Tab(text: 'Stats'),
                Tab(text: 'Evolution'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              dividerColor: Colors.transparent,
              labelStyle:
                  textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: textTheme.labelLarge,
              indicatorColor: Colors.white,
            ),
            const SizedBox(
              height: PokedexSpacing.kM,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(PokedexSpacing.kL),
                    topRight: Radius.circular(PokedexSpacing.kL),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: PokedexSpacing.kXL),
                  child: TabBarView(controller: _tabController, children: [
                    AboutPage(pokemon: widget.pokemon),
                    EvolutionPage(pokemon: widget.pokemon),
                    EvolutionPage(pokemon: widget.pokemon),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
