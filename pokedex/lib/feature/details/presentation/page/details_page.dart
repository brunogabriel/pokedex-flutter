import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';
import 'package:pokedex_flutter/feature/details/presentation/cubit/details_cubit.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_failure.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_loading.dart';
import 'package:pokedex_flutter/feature/details/presentation/widgets/details_success.dart';
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
                        DetailsSuccess(
                            pokemon: (state as DetailsSuccessState).pokemon)
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
  }
}
