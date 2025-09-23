import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/theming/colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  //الرئيسي
  static TextStyle font17regularPrimaryBlueColor = TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.primaryBlueColor,
      ),
      font22mediumPrimaryBlack = TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeightHelper.medium,
        color: ColorsManager.black,
      ),
      font17regulargrey = TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.grey,
      ),
      font12regulargrey = TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.grey,
      ),
      font13regulargrey = TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.grey,
      ),
      font15regulargrey = TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.grey,
      ),
      font15regularblack = TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.black,
      ),
      font13regularprimaryBlueColor = TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.primaryBlueColor,
      ),
      font15regularred = TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.red,
      );
}
