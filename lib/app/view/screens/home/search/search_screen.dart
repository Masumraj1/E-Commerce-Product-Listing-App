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
