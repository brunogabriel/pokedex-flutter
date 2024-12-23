import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../design/components/error_page.dart';
import '../../../../design/components/loading_page.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_success.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<SearchCubit>()..requestResources(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.runtimeType == SearchSuccessState) {
            return const SearchSuccess();
          } else if (state.runtimeType == SearchFailureState) {
            return Scaffold(
              appBar: AppBar(),
              body: ErrorPage(
                onTap: () => context.read<SearchCubit>().requestResources(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: const LoadingPage(),
            );
          }
        },
      ),
    );
  }
}
