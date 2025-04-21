// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:recipe_app/app/core/route_path.dart';
// import 'package:recipe_app/app/core/routes.dart';
// import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
// import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
// import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
// import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//
//       //===================>>>>>Appbar<<<<<<<===========
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         centerTitle: true,
//         title: CustomText(
//           text: AppStrings.home,
//           fontSize: 20.sp,
//           fontWeight: FontWeight.w500,
//           color: Colors.black,
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//         child: Column(
//           children: [
//             //===================>>>>>Search<<<<<<<===========
//             CustomTextField(
//               onTap: () {
//                 AppRouter.route.pushNamed(RoutePath.searchScreen);
//               },
//               readOnly: true,
//               fillColor: AppColors.whiteColor,
//               fieldBorderColor: AppColors.gray300,
//               hintText: AppStrings.searchAny,
//               prefixIcon: const Icon(Icons.search),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/core/route_path.dart';
import 'package:recipe_app/app/core/routes.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';
import 'package:recipe_app/app/view/common_widgets/product_title/product_title.dart';
import 'package:recipe_app/app/view/screens/home/controller/home_controller.dart';


class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent &&
          controller.hasMore.value &&
          !controller.isLoadingMore.value) {
        controller.loadMoreProducts();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async => controller.fetchInitialProducts(),
          child: Column(
            children: [
                          //===================>>>>>Search<<<<<<<===========
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
              Expanded(
                child: controller.products.isEmpty
                    ? Center(child: Text('No Products Available'))
                    : GridView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return ProductTile(product: product);
                  },
                ),
              )
,
              if (controller.isLoadingMore.value)
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      }),
    );
  }
}
