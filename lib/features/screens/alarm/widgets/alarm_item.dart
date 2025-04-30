import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../models/alarm_model.dart';
class AlarmItem extends StatelessWidget {
  final AlarmModel alarm;
  final Function(bool) onToggle;
  const AlarmItem({
    Key? key,
    required this.alarm,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alarm.formattedTime,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  alarm.displayDate,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(width: 16),
                Switch(
                  value: alarm.isEnabled,
                  onChanged: onToggle,
                  activeColor: AppTheme.primaryColor,
                  activeTrackColor: AppTheme.primaryColor.withOpacity(0.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
