/// API endpoints for the application
class ApiEndpoints {
  // Base URLs
  static const String devBaseUrl = 'https://dev-api.example.com/v1';
  static const String prodBaseUrl = 'https://api.example.com/v1';

  // Weather API endpoints
  static const String weather = '/weather';
  static const String forecast = '/forecast';

  // User API endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String profile = '/user/profile';

  // Sunset API endpoints
  static const String sunsetTimes = '/sunset';

  // Alarm API endpoints
  static const String alarms = '/alarms';

  // Location API endpoints
  static const String locations = '/locations';
  static const String geocode = '/geocode';

  // Notification API endpoints
  static const String notifications = '/notifications';
  static const String notificationSettings = '/notifications/settings';

  // Feedback API endpoints
  static const String feedback = '/feedback';

  // Settings API endpoints
  static const String settings = '/settings';

  // Get the base URL based on the environment
  static String getBaseUrl({bool isProduction = false}) {
    return isProduction ? prodBaseUrl : devBaseUrl;
  }
}