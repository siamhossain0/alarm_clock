import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../models/alarm_model.dart';
import '../../../core/theme/app_theme.dart';
import 'widgets/location_section.dart';
import 'widgets/alarm_list.dart';

class AlarmScreen extends StatefulWidget {
  final String location;

  const AlarmScreen({Key? key, required this.location}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final List<AlarmModel> _alarms = [
    AlarmModel(id: '1', time: DateTime(2025, 3, 21, 19, 10)),
    AlarmModel(id: '2', time: DateTime(2025, 3, 28, 18, 55)),
    AlarmModel(id: '3', time: DateTime(2025, 4, 4, 19, 0)),
  ];

  void _addAlarm() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF8A56FF),
            onPrimary: Colors.white,
            surface: Color(0xFF2A2A2A),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      ),
    );

    if (selectedTime != null) {
      final now = DateTime.now();
      final newTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
      setState(() {
        _alarms.add(AlarmModel(id: const Uuid().v4(), time: newTime));
      });
    }
  }

  void _toggleAlarm(String id, bool isEnabled) {
    setState(() {
      final index = _alarms.indexWhere((a) => a.id == id);
      if (index != -1) {
        _alarms[index] = _alarms[index].copyWith(isEnabled: isEnabled);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              LocationSection(location: widget.location, onAddAlarm: _addAlarm),
              const SizedBox(height: 32),
              Text('Alarms', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              AlarmList(alarms: _alarms, onToggle: _toggleAlarm),
            ],
          ),
        ),
      ),
    );
  }
}
