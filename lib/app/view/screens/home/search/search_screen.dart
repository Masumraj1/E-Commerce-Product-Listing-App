import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/app_strings/app_strings.dart';
import 'package:recipe_app/app/utils/custom_assets/assets.gen.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text_field/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child:  Column(
          children: [
            //===================>>>>>Search<<<<<<<===========
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: CustomTextField(
                    onTap: (){},
                    fillColor: AppColors.whiteColor,
                    fieldBorderColor: AppColors.gray300,
                    hintText: AppStrings.searchAny,
                    prefixIcon: const Icon(Icons.search),

                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Assets.icons.sort.image())
              ],
            ),




          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/app/view/common_widgets/product_title/product_title.dart';
// import 'package:recipe_app/app/view/screens/home/controller/home_controller.dart';
//
//
// class SearchScreen extends StatelessWidget {
//   final controller = Get.find<HomeController>(); // same controller
//
//   final TextEditingController searchController = TextEditingController();
//   final RxString sortOption = ''.obs;
//
//   SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Search")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search product',
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.search),
//                         onPressed: () {
//                           controller.searchProducts(searchController.text, sortOption.value);
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 DropdownButton<String>(
//                   hint: const Text("Sort"),
//                   value: sortOption.value == '' ? null : sortOption.value,
//                   items: ['priceLow', 'ratingHigh']
//                       .map((e) => DropdownMenuItem(
//                     value: e,
//                     child: Text(e == 'priceLow' ? 'Price ↑' : 'Rating ↓'),
//                   ))
//                       .toList(),
//                   onChanged: (value) {
//                     sortOption.value = value!;
//                     controller.searchProducts(searchController.text, sortOption.value);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Obx(() {
//               if (controller.searchResults.isEmpty) {
//                 return const Center(child: Text("No products found"));
//               }
//
//               return GridView.builder(
//                 padding: const EdgeInsets.all(12),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 12, mainAxisSpacing: 12),
//                 itemCount: controller.searchResults.length,
//                 itemBuilder: (context, index) {
//                   final product = controller.searchResults[index];
//                   return ProductTile(product: product);
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
