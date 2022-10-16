import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
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
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
  }

  void saveTokenAndProceedToBase() {
    utilsServices.saveLocalData(
      key: StorageKeys.token,
      data: user.token!,
    );
    Get.offNamed(PagesRoutes.baseRoute);
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);
    if (token == null) {
      Get.offNamed(PagesRoutes.signRoute);
      return;
    }
    AuthResult result = await authRepository.validationToken(token);
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    // Zerar user
    user = UserModel();

    // Remover o token local
    await utilsServices.deleteLocalData(key: StorageKeys.token);

    // Direcionar ao login
    Get.offNamed(PagesRoutes.signRoute);
  }
}
