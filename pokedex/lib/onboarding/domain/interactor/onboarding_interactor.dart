import 'package:injectable/injectable.dart';
import 'package:pokedex/onboarding/data/repository/pokemon_repository.dart';
import 'package:pokedex/onboarding/data/response/onboarding_response.dart';

@Injectable(as: IOnboardingInteractor)
class OnboardingInteractor implements IOnboardingInteractor {
  final IOnboardingRepository _repository;

  const OnboardingInteractor(this._repository);

  @override
  Future<List<OnboardingResponse>> takeOnboarding() async =>
      await _repository.fetchOnboarding();
}

abstract class IOnboardingInteractor {
  Future<List<OnboardingResponse>> takeOnboarding();
}
