import '../../models/onboarding_data.dart';

class AppConstants {
  // Onboarding data
  static final List<OnboardingData> onboardingData = [
    OnboardingData(
      title: 'Sync with Nature\'s Rhythm',
      description: 'Experience a peaceful transition into the evening with an alarm that aligns with the sunset. Your perfect reminder, always 15 minutes before sundown',
      imagePath: 'assets/images/SUMMER.gif',
      titleHighlightWord: 'Sync',
      pageIndex: 0,
    ),
    OnboardingData(
      title: 'Effortless and Automatic',
      description: 'No need to ser alarms manually.Wakey calculates the sunset time for your location and alerts you on time.',
      imagePath: 'assets/images/onboarding_2.png',
      titleHighlightWord: 'Automatic',
      pageIndex: 1,
    ),
    OnboardingData(
      title: 'Relax & Unwind ',
      description: 'hope to take the courage to pursue your dreams',
      imagePath: 'assets/images/onboarding_3.gif',
      titleHighlightWord: '',
      pageIndex: 2,
    ),
  ];
}

