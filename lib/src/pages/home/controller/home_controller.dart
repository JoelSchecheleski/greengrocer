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
  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  RxString searchTitle = ''.obs;

  List<ItemModel> get allProducts => currentCategory?.items ?? [];

  bool get isLastPage {
    if (currentCategory!.items.length < itemPerPage) return true;
    return (currentCategory!.pagination * itemPerPage) > allProducts.length;
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();

    debounce(
      searchTitle,
      (_) {
        filterByTitle();
      },
      time: const Duration(milliseconds: 600),
    );

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
    if (currentCategory!.items.isNotEmpty) return;
    getProductList();
  }

  // Obtem os produtos
  Future<void> getProductList({bool canLoad = true}) async {
    if (canLoad) {
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'itemsPerPage': itemPerPage
    };

    if (searchTitle.value.isNotEmpty) {
      body['title'] = searchTitle.value;
      if(currentCategory!.id == '') {
        body.remove('categoryId');
      }
    }

    HomeResult<ItemModel> homeResult =
        await homeRepository.getProductList(body);
    setLoading(false, isProduct: true);

    homeResult.when(
      success: (data) {
        currentCategory!.items.addAll(data);
      },
      error: (message) {
        utilsService.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  // Carrega mais produtos
  void loadMoreProducts() {
    currentCategory!.pagination++;
    getProductList(canLoad: false);
  }

  // Filtrar dados pelo campos de pesquisa
  void filterByTitle() {
    for (var category in allCategories) {
      // limpas as categorias
      category.items.clear();
      category.pagination = 0;
    }

    if (searchTitle.value.isEmpty) {
      allCategories.removeAt(0);
    } else {
      CategoryModel? c = allCategories.firstWhereOrNull(
        (category) => category.id == '',
      );
      if (c == null) {
        final allProductsCategory = CategoryModel(
          // Criar uma nova categoria com todos
          id: '',
          title: 'Todos',
          items: [],
          pagination: 0,
        );
        allCategories.insert(0, allProductsCategory);
      } else {
        c.items.clear();
        c.pagination = 0;
      }
    }

    currentCategory = allCategories.first;
    update();
    getProductList();
  }
}
