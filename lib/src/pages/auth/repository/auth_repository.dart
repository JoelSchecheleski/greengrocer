import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_errors.dart'
    as authError;
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrorsString(result['error']));
    }
  }

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
    return handleUserOrError(result);
  }

  // Validação de login
  Future<AuthResult> validationToken(String token) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.validationToken,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {},
    );
    return handleUserOrError(result);
  }

  // Cadastro de usuário
  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );
    return handleUserOrError(result);
  }
}
