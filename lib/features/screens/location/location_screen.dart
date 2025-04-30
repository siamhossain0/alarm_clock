import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../alarm/alarm_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  void _navigateToAlarmScreen(BuildContext context, {bool useCurrentLocation = true}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const AlarmScreen(
          location: '79 Regent\'s Park Rd, London\n NW1 8UY, United Kingdom',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome! Your\nPersonalized Alarm',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'Allow us to sync your sunset alarm based on your location.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const Spacer(flex: 1),

              Center(
                child: Flexible(
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/sunset_mountains.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 1),

              _buildButton(
                text: 'Use Current Location',
                icon: Icons.location_on_outlined,
                onPressed: () => _navigateToAlarmScreen(context),
              ),
              const SizedBox(height: 16),

              _buildButton(
                text: 'Home',
                onPressed: () => _navigateToAlarmScreen(context, useCurrentLocation: false),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    IconData? icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 20),
            ],
          ],
        ),
      ),
    );
  }

}
