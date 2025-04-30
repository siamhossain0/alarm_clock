import 'package:flutter/material.dart';
import '../../../../common/widgets/rounded_bottom_clipper.dart';
import 'skip_button.dart';

class OnboardingImageSection extends StatelessWidget {
  final String imagePath;
  final VoidCallback onSkipPressed;

  const OnboardingImageSection({
    Key? key,
    required this.imagePath,
    required this.onSkipPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.5; // Half of the screen height

    return ClipPath(
      clipper: RoundedBottomClipper(),
      child: Container(
        height: imageHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Skip button
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 20,
              child: SkipButton(onPressed: onSkipPressed),
            ),
          ],
        ),
      ),
    );
  }
}