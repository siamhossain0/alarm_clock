import 'package:flutter/material.dart';
import 'add_alarm_button.dart';

class LocationSection extends StatelessWidget {
  final String location;
  final VoidCallback onAddAlarm;

  const LocationSection({
    Key? key,
    required this.location,
    required this.onAddAlarm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Text(
            'Selected Location',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  location,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        AddAlarmButton(onPressed: onAddAlarm),
      ],
    );
  }
}
