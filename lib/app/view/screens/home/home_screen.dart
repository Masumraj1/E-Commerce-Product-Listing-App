import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/core/route_path.dart';
import 'package:recipe_app/app/core/routes.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';
import 'package:recipe_app/app/view/common_widgets/product_card/product_card.dart';
import 'package:recipe_app/app/view/screens/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      //===================>>>>>Appbar<<<<<<<===========
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: CustomText(
          text: AppStrings.home,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            //===================>>>>>Search Field<<<<<<<===========
            CustomTextField(
              onTap: () {
                AppRouter.route.pushNamed(RoutePath.searchScreen);
              },
              readOnly: true,
              fillColor: AppColors.whiteColor,
              fieldBorderColor: AppColors.gray300,
              hintText: AppStrings.searchAny,
              prefixIcon: const Icon(Icons.search),
            ),
            SizedBox(height: 24.h),

            //===================>>>>>Product Grid<<<<<===========
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(), // Make the grid scrollable
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10.w, // Space between columns
                  mainAxisSpacing: 10.h, // Space between rows
                  childAspectRatio: 0.1, // Aspect ratio for the card
                ),
                itemCount: homeController.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: homeController.products[index]['imageUrl'],
                    title: homeController.products[index]['title'],
                    currentPrice: homeController.products[index]['currentPrice'],
                    originalPrice: homeController.products[index]['originalPrice'],
                    discount: homeController.products[index]['discount'],
                    rating: homeController.products[index]['rating'],
                    reviewsCount: homeController.products[index]['reviewsCount'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
