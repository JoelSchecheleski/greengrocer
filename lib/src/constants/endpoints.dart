const String baseUrl = 'https://parseapi.back4app.com/functions/';

abstract class EndPoints {
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/signup';
  static const String validationToken = '$baseUrl/validate-token';
  static const String resetPassword = '$baseUrl/reset-password';
}
