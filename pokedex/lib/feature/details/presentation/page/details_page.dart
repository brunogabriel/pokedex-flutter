import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter/design/components/error_page.dart';
import 'package:pokedex_flutter/design/components/loading_page.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';
import 'package:pokedex_flutter/feature/details/presentation/cubit/details_cubit.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_success.dart';
import 'package:pokedex_flutter/shared/extensions/pokemon_type_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.id,
  });

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
                begin: PokedexThemeData.backgroundDetails,
                end: state.runtimeType == DetailsSuccessState
                    ? (state as DetailsSuccessState)
                        .pokemon
                        .types
                        .first
                        .color
                        .secundary
                    : PokedexThemeData.backgroundDetails),
            builder: (_, Color? newBackgroundColor, __) {
              return Scaffold(
                backgroundColor: newBackgroundColor,
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: PokedexSpacing.kS),
                      child: IconButton(
                        onPressed: () {
                          context.pushReplacementNamed(
                            'details',
                            pathParameters: {
                              'id': Random().nextInt(1010).toString()
                            },
                          );
                        },
                        icon: Image.asset(
                          'images/pokeball.png'.asset(),
                          color: Colors.white,
                          width: 32,
                          height: 32,
                        ),
                      ),
                    )
                  ],
                ),
                body: SafeArea(
                  child: Stack(
                    children: [
                      if (state.runtimeType == DetailsSuccessState) ...{
                        DetailsSuccess(
                            pokemon: (state as DetailsSuccessState).pokemon)
                      } else if (state.runtimeType == DetailsFailureState) ...{
                        ErrorPage(
                          onTap: () => context
                              .read<DetailsCubit>()
                              .requestPokemon(widget.id),
                          textColor: Colors.white,
                        ) // pass try again action here
                      } else ...{
                        const LoadingPage(
                          color: Colors.white,
                        )
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
  }
}
