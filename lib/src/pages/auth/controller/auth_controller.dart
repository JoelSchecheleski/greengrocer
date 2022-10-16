import 'package:get/get.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/page_routes/app_pages.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final AuthRepository authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signin(
      email: email,
      password: password,
    );
    isLoading.value = false;
    result.when(
      success: (user) {
        this.user = user;
        Get.offNamed(PagesRoutes.baseRoute);
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
  }
}
