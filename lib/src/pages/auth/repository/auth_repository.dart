import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_errors.dart'
    as authError;
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  // Login
  Future<AuthResult> signin({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrorsString(result['error']));
    }
  }

  // Validação de login
  Future<AuthResult> validationToken(String token) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.validationToken,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {},
    );
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrorsString(result['error']));
    }
  }
}
