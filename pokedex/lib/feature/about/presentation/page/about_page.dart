import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokedex.dart';

import '../../../../design/components/error_page.dart';
import '../../../../design/components/loading_page.dart';
import '../../../../shared/extensions/pokemon_type_extensions.dart';
import '../cubit/about_cubit.dart';
import '../widgets/about_success.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<AboutCubit>()..requestData(widget.pokemon),
      child: BlocBuilder<AboutCubit, AboutState>(
        builder: (context, state) {
          if (state.runtimeType == AboutSuccessState) {
            return const AboutSuccess();
          } else if (state.runtimeType == AboutFailureState) {
            return ErrorPage(
              assetSize: 120,
              onTap: () =>
                  context.read<AboutCubit>()..requestData(widget.pokemon),
            );
          }
          return LoadingPage(color: widget.pokemon.types.first.color.primary);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
