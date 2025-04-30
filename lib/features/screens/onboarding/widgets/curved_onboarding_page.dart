import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../models/onboarding_data.dart';
import 'onboarding_content.dart';
import 'onboarding_image_section.dart';

class CurvedOnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;

  const CurvedOnboardingPage({
    Key? key,
    required this.data,
    required this.onNextPressed,
    required this.onSkipPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // Image section with rounded bottom corners
          OnboardingImageSection(
            imagePath: data.imagePath,
            onSkipPressed: onSkipPressed,
          ),

          // Content section
          Expanded(
            child: OnboardingContent(
              data: data,
              onNextPressed: onNextPressed,
            ),
          ),
        ],
      ),
    );
  }
}