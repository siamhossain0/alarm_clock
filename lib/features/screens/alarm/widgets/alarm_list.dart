import 'package:flutter/material.dart';
import '../../../../models/alarm_model.dart';
import 'alarm_item.dart';

class AlarmList extends StatelessWidget {
  final List<AlarmModel> alarms;
  final Function(String, bool) onToggle;

  const AlarmList({
    Key? key,
    required this.alarms,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          final alarm = alarms[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AlarmItem(
              alarm: alarm,
              onToggle: (value) => onToggle(alarm.id, value),
            ),
          );
        },
      ),
    );
  }
}
