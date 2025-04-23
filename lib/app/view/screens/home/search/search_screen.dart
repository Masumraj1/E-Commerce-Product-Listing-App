import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/utils/custom_assets/assets.gen.dart';
import 'package:recipe_app/app/utils/enums/status.dart';
import 'package:recipe_app/app/view/common_widgets/custom_loader/custom_loader.dart';
import 'package:recipe_app/app/view/common_widgets/custom_product_card/custom_product_card.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';
import 'package:recipe_app/app/view/common_widgets/genarel_error_screen/genarel_error_screen.dart';
import 'package:recipe_app/app/view/common_widgets/no_internet_screen/no_internet_screen.dart';
import 'package:recipe_app/app/view/screens/home/controller/home_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final aspectRatio = screenWidth / (screenWidth * 2.0);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: CustomText(
          text: AppStrings.search,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return NoInternetScreen(onTap: () => homeController.getProduct());
            case Status.error:
              return GeneralErrorScreen(onTap: () => homeController.getProduct());
            case Status.completed:
              return Column(
                children: [
                  // ───────────── search & sort row ─────────────
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: CustomTextField(
                          onChanged: homeController.filterProductByName,
                          fillColor: AppColors.whiteColor,
                          fieldBorderColor: AppColors.gray300,
                          hintText: AppStrings.searchAny,
                          prefixIcon: const Icon(Icons.search),
                          inputTextStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () => _openSortSheet(context),
                          child: Assets.icons.sort.image(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // ───────────── grid ─────────────
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: aspectRatio,
                      ),
                      itemCount: homeController.searchedProducts.length,
                      itemBuilder: (context, index) {
                        final data = homeController.searchedProducts[index];
                        return CustomProductCard(
                          imageUrl: data.images.first,
                          title: data.title,
                          currentPrice: '${data.price}',
                          originalPrice: '30',
                          discount: '${data.discountPercentage}',
                          rating: data.rating,
                          reviewsCount: 41,
                        );
                      },
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox();
          }
        }),
      ),
    );
  }

  // ────────────────── bottom‑sheet sort selector ──────────────────
  void _openSortSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.price_change),
              title: const Text('দাম: কম → বেশি'),
              onTap: () {
                homeController.sortByPriceAscending();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_rate),
              title: const Text('রেটিং: বেশি → কম'),
              onTap: () {
                homeController.sortByRatingDescending();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
