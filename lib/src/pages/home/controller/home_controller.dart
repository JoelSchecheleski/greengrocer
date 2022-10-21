import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_service.dart';

const int itemPerPage = 6;

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsService = UtilsServices();
  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  // Obtem as categorias
  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();
    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);
        if (allCategories.isEmpty) return;

        selectCategory(data.first);
      },
      error: (message) {
        utilsService.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
    getProductList();
  }

  // Obtem os produtos
  Future<void> getProductList() async {

    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'itemsPerPage': itemPerPage
    };

    setLoading(true);
    HomeResult<ItemModel> homeResult = await homeRepository.getProductList(body);
    setLoading(false);

    homeResult.when(
      success: (data) {
        print(data.toString());
      },
      error: (message) {
        utilsService.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
