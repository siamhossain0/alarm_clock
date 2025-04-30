import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../models/onboarding_data.dart';
import 'highlighetd_title.dart';

import 'page_indicator.dart';
import 'next_button.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingData data;
  final VoidCallback onNextPressed;

  const OnboardingContent({
    Key? key,
    required this.data,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed height section for title and description
          SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                HighlightedTitle(
                  title: data.title,
                  highlightWord: data.titleHighlightWord,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Text(
                    data.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 75),

          // Fixed bottom section for dots + next button
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PageIndicator(
                currentIndex: data.pageIndex,
                totalPages: AppConstants.onboardingData.length,
              ),
              const SizedBox(height: 24),
              NextButton(onPressed: onNextPressed),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}