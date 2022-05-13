import 'package:injectable/injectable.dart';
import 'package:pokedex/onboarding/data/response/onboarding_response.dart';

@Injectable(as: IOnboardingService)
class OnboardingService implements IOnboardingService {
  @override
  Future<List<OnboardingResponse>> getOnboarding() async =>
      <OnboardingResponse>[
        const OnboardingResponse(
          title: 'Hello',
          content: 'Welcome to the world of Pokémon!',
          asset: 'images/onboarding/onboarding1.png',
        ),
        const OnboardingResponse(
          title: 'But, what is?',
          content: 'This world is inhabited by creatures called Pokémon.',
          asset: 'images/onboarding/onboarding2.png',
        ),
        const OnboardingResponse(
          title: 'A curious information',
          content:
              'For some people, Pokémons are pets. Others use them for fights or study.',
          asset: 'images/onboarding/onboarding3.png',
        ),
      ];
}

abstract class IOnboardingService {
  Future<List<OnboardingResponse>> getOnboarding();
}
