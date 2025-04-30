import 'package:alarm/features/screens/onboarding/widgets/curved_onboarding_page.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../location/location_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  // Navigate to the next page
  void _goToNextPage() {
    if (_currentPage < AppConstants.onboardingData.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      _navigateToLocationScreen();
    }
  }

  // Skip the onboarding process
  void _skipOnboarding() {
    _navigateToLocationScreen();
  }

  // Navigate to the location screen
  void _navigateToLocationScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LocationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CurvedOnboardingPage(
      data: AppConstants.onboardingData[_currentPage],
      onNextPressed: _goToNextPage,
      onSkipPressed: _skipOnboarding,
    );
  }
}