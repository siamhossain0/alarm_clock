import 'dart:math';

class SunsetCalculator {
  /// Calculate sunset time for a given date and location
  static DateTime calculateSunset(
      DateTime date,
      double latitude,
      double longitude,
      {double zenith = 90.83}
      ) {
    final latRad = _toRadians(latitude);

    final n = date.difference(DateTime(date.year, 1, 1)).inDays + 1;

    // Calculate solar declination
    final decl = 0.4093 * sin((2 * pi * (284 + n)) / 365);

    final cosH = (cos(_toRadians(zenith)) - (sin(latRad) * sin(decl))) /
        (cos(latRad) * cos(decl));

    // Check if the sun never sets or rises at this location on this date
    if (cosH > 1) {
      throw Exception("Sun never sets on this location on this date");
    }
    if (cosH < -1) {
      throw Exception("Sun never rises on this location on this date");
    }

    final H = _toDegrees(acos(cosH));


    final T = H / 15;
    final UT = T - (longitude / 15);
    final hours = UT.floor();
    final minutes = ((UT - hours) * 60).round();

    return DateTime(
      date.year,
      date.month,
      date.day,
      hours,
      minutes,
    );
  }

  static DateTime calculateReminderTime(DateTime sunsetTime) {
    return sunsetTime.subtract(const Duration(minutes: 15));
  }
  static double _toRadians(double degrees) {
    return degrees * pi / 180;
  }
  static double _toDegrees(double radians) {
    return radians * 180 / pi;
  }
}