import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/onboarding/domain/interactor/onboarding_interactor.dart';
import 'package:pokedex/shared/widgets/dot_indicator_widget.dart';
import 'package:pokedex/shared/widgets/onboarding_widget.dart';

import '../../data/response/onboarding_response.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  late IOnboardingInteractor _interactor;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    _interactor = GetIt.I.get();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: _buildOnboarding(),
    );
  }

  void changeIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  Widget _buildOnboarding() {
    return FutureBuilder<List<OnboardingResponse>>(
        future: _interactor.takeOnboarding(),
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            return _buildOnboardingContent(snapshot.data ?? []);
          } else if (snapshot.hasError) {
            return const Text('Has error');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _buildOnboardingContent(List<OnboardingResponse> response) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: _buildPageView(response),
              ),
              _buildOnboardingBox(response)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingBox(List<OnboardingResponse> response) {
    return Row(
      children: [
        ...List.generate(
            response.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: DotIndicatorWidget(
                    active: index == _currentIndex,
                  ),
                )),
        const Spacer(),
        SizedBox(
          height: 60,
          width: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            onPressed: () {
              if (_currentIndex == response.length - 1) {
                Navigator.pushNamed(context, '/pokemons');
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            child: _currentIndex == response.length - 1
                ? const Icon(Icons.close)
                : const Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }

  Widget _buildPageView(List<OnboardingResponse> response) {
    return PageView.builder(
      onPageChanged: (index) => changeIndex(index),
      itemCount: response.length,
      controller: _pageController,
      itemBuilder: (context, index) => OnboardingWidget(
        title: response[index].title,
        content: response[index].content,
        thumbnail: response[index].asset,
      ),
    );
  }
}
