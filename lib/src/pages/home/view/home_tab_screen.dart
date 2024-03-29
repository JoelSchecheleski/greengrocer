import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/base/controller/navigation_controller.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_shimmer.dart';
import 'package:greengrocer/src/pages/home/controller/home_controller.dart';
import 'package:greengrocer/src/pages/home/view/components/category_tile.dart';
import 'package:greengrocer/src/pages/home/view/components/item_tile.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final UtilsServices utilsServices = UtilsServices();
  final searchController = TextEditingController();
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            utilsServices.showToast(
              message: 'GreenGrocer',
              isError: false,
            );
          },
          child: const AppNameWidget(),
        ),
        // actions
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GetBuilder<CartController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    navigationController.navigatePageView(NavigationTabs.cart);
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 10, end: 10),
                    badgeContent: Text(
                      controller.cartItems.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    badgeStyle: badges.BadgeStyle(badgeColor: CustomColors.customContrastColor),
                    child: Icon(
                      Icons.shopping_cart,
                      color: CustomColors.customSwatchColor,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),

      body: Column(
        children: [
          // Campo de pesquisa
          GetBuilder<HomeController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    controller.searchTitle.value = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    hintText: "Pesquisar por...",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColors.customContrastColor,
                      size: 21,
                    ),
                    suffixIcon: controller.searchTitle.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();
                              controller.searchTitle.value = '';
                              FocusScope.of(context).unfocus();
                            },
                            icon: Icon(
                              Icons.close,
                              color: CustomColors.customContrastColor,
                              size: 21,
                            ),
                          )
                        : null,
                    // suffixIcon: ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ),
              );
            },
          ),

          // Categorias
          GetBuilder<HomeController>(
            builder: (controller) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 25,
                ),
                height: 40,
                child: !controller.isCategoryLoading
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return CategoryTile(
                              onPressed: () {
                                //
                                controller.selectCategory(
                                    controller.allCategories[index]);
                              },
                              category: controller.allCategories[index].title,
                              isSelected: controller.allCategories[index] ==
                                  controller.currentCategory);
                        },
                        separatorBuilder: (_, index) =>
                            const SizedBox(width: 10),
                        itemCount: controller.allCategories.length,
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          10,
                          (index) => Container(
                            margin: const EdgeInsets.only(
                              right: 12,
                            ),
                            alignment: Alignment.center,
                            child: CustomShimmer(
                              borderRadius: BorderRadius.circular(20),
                              height: 20,
                              width: 80,
                            ),
                          ),
                        ),
                      ),
              );
            },
          ),

          // Grid
          GetBuilder<HomeController>(builder: (controller) {
            return Expanded(
              child: !controller.isProductLoading
                  ? Visibility(
                      visible:
                          (controller.currentCategory?.items ?? []).isNotEmpty,
                      replacement: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 40,
                              color: CustomColors.customSwatchColor,
                            ),
                            const Text('Não há itens para apresentar')
                          ]),
                      child: GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                        ),
                        itemCount: controller.allProducts.length,
                        itemBuilder: (_, index) {
                          if (((index + 1) == controller.allProducts.length) &&
                              !controller.isLastPage) {
                            controller.loadMoreProducts();
                          }
                          return ItemTile(
                            item: controller.allProducts[index],
                          );
                        },
                      ),
                    )
                  : GridView.count(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: List.generate(
                        10,
                        (_) => CustomShimmer(
                          borderRadius: BorderRadius.circular(20),
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
            );
          }),
        ],
      ),
    );
  }
}
/**
 * leading: Badge(
    position: BadgePosition.topEnd(top: 10, end: 10),
    badgeContent: null,
    child: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
    ),
    ), *
 */
