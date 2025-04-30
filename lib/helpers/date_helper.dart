import 'package:intl/intl.dart';

class DateHelper {

  static String formatTimeOfDay(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }


  static String formatFullDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, yyyy').format(dateTime);
  }


  static String formatShortDate(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }


  static String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1: return 'st';
      case 2: return 'nd';
      case 3: return 'rd';
      default: return 'th';
    }
  }


  static String formatDateWithSuffix(DateTime dateTime) {
    final day = dateTime.day;
    final month = DateFormat('MMM').format(dateTime);
    final suffix = getDaySuffix(day);

    return '$month $day$suffix';
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }


  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }


  static DateTime todayAt(int hour, int minute) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }


  static DateTime tomorrowAt(int hour, int minute) {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));
    return DateTime(tomorrow.year, tomorrow.month, tomorrow.day, hour, minute);
  }
}