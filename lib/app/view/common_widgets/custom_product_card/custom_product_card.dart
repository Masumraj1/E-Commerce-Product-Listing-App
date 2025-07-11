import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/view/common_widgets/custom_network_image/custom_network_image.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';

class CustomProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String currentPrice;
  final String originalPrice;
  final String discount;
  final double rating;
  final int reviewsCount;

  const CustomProductCard({
    required this.imageUrl,
    required this.title,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.reviewsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 164.h,
              width: 156.w,
              decoration: BoxDecoration(
                color: AppColors.containerBg,
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              ),
              child: Column(
                children: [
                  CustomNetworkImage(

                    imageUrl: imageUrl,
                    height: 164.h,
                    width: 156.w,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 5.w, // Position the icon 5 units from the right
              top: 5.h, // Keep the top position as it was
              child: Container(
                padding: EdgeInsets.all(5.r),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            width: 156.w,
            height: 164.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  top: 8.h,
                  bottom: 8.h,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  text: title,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: AppColors.gray700,
                ),
                Row(
                  children: [
                    CustomText(
                      text: currentPrice,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.gray700,
                    ),
                    Expanded(
                      child: CustomText(
                        decoration: TextDecoration.lineThrough,
                        left: 4.w,
                        text: originalPrice,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.gray400,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        left: 4.w,
                        text: discount,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: AppColors.orange600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                          color: AppColors.yellow500,
                          borderRadius: BorderRadius.all(Radius.circular(4.r))),
                      child: const Icon(
                        Icons.star,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    CustomText(
                      left: 4.w,
                      top: 4.h,
                      text: "$rating",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.gray700,
                    ),
                    CustomText(
                      left: 7.w,
                      top: 4.h,
                      text: "($reviewsCount)",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppColors.gray500,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
