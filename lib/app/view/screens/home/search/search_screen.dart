import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/utils/custom_assets/assets.gen.dart';
import 'package:recipe_app/app/utils/enums/status.dart';
import 'package:recipe_app/app/view/common_widgets/custom_loader/custom_loader.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';
import 'package:recipe_app/app/view/common_widgets/genarel_error_screen/genarel_error_screen.dart';
import 'package:recipe_app/app/view/common_widgets/no_internet_screen/no_internet_screen.dart';
import 'package:recipe_app/app/view/common_widgets/product_card/product_card.dart';
import 'package:recipe_app/app/view/screens/home/controller/home_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double aspectRatio = screenWidth / (screenWidth * 2.0);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      //===================>>>>>Appbar<<<<<<<===========
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
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
              return const CustomLoader(); // Show loading indicator
            case Status.internetError:
              return NoInternetScreen(onTap: () {
                homeController.getProduct();
              });
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  homeController.getProduct();
                },
              );
            case Status.completed:
              return Column(
                children: [
                  //===================>>>>>Search<<<<<<<===========
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: CustomTextField(
                          onTap: () {},
                          fillColor: AppColors.whiteColor,
                          fieldBorderColor: AppColors.gray300,
                          hintText: AppStrings.searchAny,
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                      Expanded(flex: 2, child: Assets.icons.sort.image())
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Expanded(
                    flex: 9,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: aspectRatio,
                      ),
                      itemCount: homeController.productList.length,
                      itemBuilder: (context, index) {
                        final data = homeController.productList[index];
                        return ProductCard(
                          imageUrl: data.images.first,
                          title: data.title,
                          currentPrice: data.price.toString(),
                          originalPrice: "30",
                          discount: data.discountPercentage.toString(),
                          rating: data.rating,
                          reviewsCount: 41,
                        );
                      },
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox(); // Handle any other state
          }
        }),
      ),
    );
  }
}
