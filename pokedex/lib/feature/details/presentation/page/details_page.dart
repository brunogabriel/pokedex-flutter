import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';
import 'package:pokedex_flutter/feature/about/presentation/page/about_page.dart';
import 'package:pokedex_flutter/feature/details/presentation/cubit/details_cubit.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_failure.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_header.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_loading.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_success.dart';
import 'package:pokedex_flutter/feature/evolution/presentation/page/evolution_page.dart';
import 'package:pokedex_flutter/shared/extensions/pokemon_type_extensions.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<DetailsCubit>()..requestPokemon(widget.id),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: ColorTween(
                begin: PokedexThemeData.greyLevel1,
                end: state.runtimeType == DetailsSuccessState
                    ? (state as DetailsSuccessState)
                        .pokemon
                        .types
                        .first
                        .color
                        .secundary
                    : PokedexThemeData.greyLevel1),
            builder: (_, Color? newBackgroundColor, __) {
              return Scaffold(
                backgroundColor: newBackgroundColor,
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                ),
                body: SafeArea(
                  child: Stack(
                    children: [
                      if (state.runtimeType == DetailsSuccessState) ...{
                        const DetailsSuccess()
                      } else if (state.runtimeType == DetailsFailureState) ...{
                        const DetailsFailure() // pass try again action here
                      } else ...{
                        const DetailsLoading()
                      }
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );

    // return BlocProvider(
    //   create: (context) =>
    //       GetIt.I.get<DetailsCubit>()..requestPokemon(widget.id),
    //   child: TweenAnimationBuilder(
    //       duration: const Duration(milliseconds: 300),
    //       tween: ColorTween(
    //           begin: PokedexThemeData.greyLevel1,
    //           end: PokedexThemeData.greyLevel1),
    //       builder: (_, Color? newBackgroundColor, __) {
    //         return BlocBuilder<DetailsCubit, DetailsState>(
    //           builder: (context, state) {
    //             return Scaffold(
    //               backgroundColor: newBackgroundColor,
    //               appBar: AppBar(
    //                 iconTheme: const IconThemeData(color: Colors.white),
    //                 backgroundColor: Colors.transparent,
    //               ),
    //               body: SafeArea(
    //                 child: Stack(
    //                   children: [
    //                     if (state.runtimeType == DetailsSuccessState) ...{
    //                       const DetailsSuccess()
    //                     } else if (state.runtimeType ==
    //                         DetailsFailureState) ...{
    //                       const DetailsFailure() // pass try again action here
    //                     } else ...{
    //                       const DetailsLoading()
    //                     }
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         );
    //       }),
    // );

    // TODO: Reuse

    //   late TabController _tabController;

    // @override
    // void initState() {
    //   super.initState();
    //   _tabController = TabController(length: 3, vsync: this);
    // }
    // final textTheme = Theme.of(context).textTheme;
    // return Scaffold(
    //   backgroundColor: widget.pokemon.types.first.color.secundary,
    //   extendBodyBehindAppBar: true,
    //   appBar: AppBar(
    //     iconTheme: const IconThemeData(color: Colors.white),
    //     backgroundColor: Colors.transparent,
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         DetailsHeader(
    //           pokemon: widget.pokemon,
    //         ),
    //         TabBar(
    //           controller: _tabController,
    //           tabs: const [
    //             Tab(text: 'About'),
    //             Tab(text: 'Stats'),
    //             Tab(text: 'Evolution'),
    //           ],
    //           labelColor: Colors.white,
    //           unselectedLabelColor: Colors.white.withOpacity(0.5),
    //           dividerColor: Colors.transparent,
    //           labelStyle:
    //               textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
    //           unselectedLabelStyle: textTheme.labelLarge,
    //           indicatorColor: Colors.white,
    //         ),
    //         const SizedBox(
    //           height: PokedexSpacing.kM,
    //         ),
    //         Expanded(
    //           child: Container(
    //             decoration: const BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(PokedexSpacing.kL),
    //                 topRight: Radius.circular(PokedexSpacing.kL),
    //               ),
    //               color: Colors.white,
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.only(top: PokedexSpacing.kXL),
    //               child: TabBarView(controller: _tabController, children: [
    //                 AboutPage(pokemon: widget.pokemon),
    //                 EvolutionPage(pokemon: widget.pokemon),
    //                 EvolutionPage(pokemon: widget.pokemon),
    //               ]),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
