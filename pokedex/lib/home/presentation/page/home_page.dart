import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/home/presentation/bloc/home_bloc.dart';

import '../widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<HomeBloc>()..add(HomeRequestEvent()),
      child: const HomeWidget(),
    );
  }
}
