class AlarmModel {
  final String id;
  final DateTime time;
  final bool isEnabled;

  AlarmModel({
    required this.id,
    required this.time,
    this.isEnabled = true,
  });

  String get formattedTime {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final period = time.hour >= 12 ? 'pm' : 'am';
    return '${hour == 0 ? 12 : hour}:${time.minute.toString().padLeft(2, '0')} $period';
  }

  String get formattedDate {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    final day = time.day;
    final month = months[time.month - 1];
    final year = time.year;

    String suffix;
    if (day >= 11 && day <= 13) {
      suffix = 'th';
    } else {
      switch (day % 10) {
        case 1: suffix = 'st'; break;
        case 2: suffix = 'nd'; break;
        case 3: suffix = 'rd'; break;
        default: suffix = 'th'; break;
      }
    }

    return '$month $day$suffix $year';
  }

  String get dayOfWeek {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[time.weekday - 1];
  }

  String get displayDate {
    return '$dayOfWeek $formattedDate';
  }

  AlarmModel copyWith({
    String? id,
    DateTime? time,
    bool? isEnabled,
  }) {
    return AlarmModel(
      id: id ?? this.id,
      time: time ?? this.time,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
