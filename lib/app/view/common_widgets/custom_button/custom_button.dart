import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/view/common_widgets/custom_text/custom_text.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = 'Welcome',
    this.marginVertical = 0,
    this.marginHorizontal = 0,
    this.fillColor = AppColors.backButtonColor,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.isRadius = false,
  });

  final double height;
  final double width;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final bool isRadius;
  final VoidCallback onTap;
  final String title;
  final double marginVertical;
  final double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: marginVertical,
          horizontal: marginHorizontal,
        ),
        alignment: Alignment.center,
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: borderColor),
          borderRadius: isRadius ? BorderRadius.circular(25.r) : BorderRadius.circular(1.r),
        ),
        child: CustomText(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
          textAlign: TextAlign.center,
          text: title,
        ),
      ),
    );
  }
}