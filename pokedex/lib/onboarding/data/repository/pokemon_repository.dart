import 'package:injectable/injectable.dart';
import 'package:pokedex/onboarding/data/service/onboarding_service.dart';

import '../response/onboarding_response.dart';

@Injectable(as: IOnboardingRepository)
class OnboardingRepository implements IOnboardingRepository {
  final IOnboardingService _service;

  const OnboardingRepository(this._service);

  @override
  Future<List<OnboardingResponse>> fetchOnboarding() async =>
      await _service.getOnboarding();
}

abstract class IOnboardingRepository {
  Future<List<OnboardingResponse>> fetchOnboarding();
}
