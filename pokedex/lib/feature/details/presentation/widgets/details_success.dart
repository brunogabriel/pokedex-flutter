import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokedex/pokedex.dart';

import '../../../../design/constants/pokedex_spacing.dart';
import '../../../about/presentation/page/about_page.dart';
import '../../../evolution/presentation/page/evolution_page.dart';
import '../../../stats/presentation/page/stats_page.dart';
import 'details_header.dart';

class DetailsSuccess extends StatefulWidget {
  const DetailsSuccess({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<DetailsSuccess> createState() => _DetailsSuccessState();
}

class _DetailsSuccessState extends State<DetailsSuccess>
    with TickerProviderStateMixin {
  late TabController _tabController;

  var _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        DetailsHeader(pokemon: widget.pokemon),
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Opacity(
                opacity: _opacity,
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
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        AboutPage(pokemon: widget.pokemon),
                        StatsPage(pokemon: widget.pokemon),
                        EvolutionPage(pokemon: widget.pokemon),
                      ],
                    ),
                  ),
                )
                    .animate(
                      onComplete: (controller) => setState(
                        () {
                          _opacity = 1.0;
                        },
                      ),
                    )
                    .moveY(
                      begin: 0,
                      end: constraints.maxHeight,
                      duration: Duration.zero,
                    )
                    .animate()
                    .moveY(
                      delay: const Duration(milliseconds: 200),
                      begin: 0,
                      end: -constraints.maxHeight,
                      duration: const Duration(milliseconds: 500),
                    ),
              );
            },
          ),
        )
      ],
    );
  }
}
