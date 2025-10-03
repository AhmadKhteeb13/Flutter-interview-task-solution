import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_workiom/core/helpers/extensions.dart';
import 'package:flutter_test_workiom/core/helpers/spacing.dart';
import 'package:flutter_test_workiom/core/theming/colors.dart';
import 'package:flutter_test_workiom/core/theming/font_weight_helper.dart';
import 'package:flutter_test_workiom/core/theming/styles.dart';
import 'package:flutter_test_workiom/core/widgets/super_button.dart';
import '../../../core/routing/routers.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  width: 375.w,
                  height: 42.h,
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        color: ColorsManager.primaryBlueColor,
                      ),
                      horizontalSpace(5),
                      Text(
                        "Sign in",
                        style: TextStyles.font17regularPrimaryBlueColor,
                      ),
                    ],
                  ),
                ),
                verticalSpace(19),
                Container(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 0,
                    bottom: 0,
                  ),
                  width: double.infinity,
                  child: Text(
                    "Create your free account",
                    style: TextStyles.font22mediumPrimaryBlack,
                  ),
                ),
                verticalSpace(8),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Row(
                    children: [
                      Text(
                        "Let's start an amazing journey!",
                        style: TextStyles.font17regulargrey,
                      ),
                      horizontalSpace(8),
                      Image.asset(
                        'assets/icons/emojione_waving-hand-light-skin-tone.png',
                        width: 22.w,
                        height: 22.w,
                      ),
                    ],
                  ),
                ),
                verticalSpace(137),
                SuperButton(
                  text: "Continue with Google",
                  onPressed: () {},
                  isLoading: false,
                  backgroundColor: ColorsManager.lightGray,
                  foregroundColor: ColorsManager.black,
                  borderRadius: 16.r,
                  padding: EdgeInsets.only(top: 14.h, bottom: 15.h),
                  width: 343.w,
                  height: 53.h,
                  icon: Image.asset('assets/icons/google.png'),
                  alignment: MainAxisAlignment.center,
                ),
                verticalSpace(30),
                Text("Or", style: TextStyles.font12regulargrey),
                verticalSpace(30),
                SuperButton(
                  text: "Continue with email",
                  onPressed: () {
                    context.pushNamed(Routes.firstScreenCompletingSignUp);
                  },
                  isLoading: false,
                  backgroundColor: ColorsManager.primaryBlueColor,
                  foregroundColor: ColorsManager.white,
                  borderRadius: 16.r,
                  padding: EdgeInsets.only(top: 15.h, bottom: 14.h, left: 50.w),
                  width: 343.w,
                  height: 53.h,
                  icon: Image.asset('assets/icons/enter.png'),
                  iconPosition: SuperButton.end,
                  iconSpacing: 62.5.w,
                ),
                verticalSpace(16),
                Padding(
                  padding: EdgeInsets.only(right: 56.5.w, left: 56.5.w),
                  child: RichText(
                    text: TextSpan(
                      text: "By signing up, you agree ",
                      style: TextStyles.font13regulargrey, // Default style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms Of Service ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeightHelper.regular,
                            color: ColorsManager.grey,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsManager.grey,
                            decorationThickness: 2.0,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        TextSpan(
                          text: 'And',
                          style: TextStyles.font13regulargrey,
                        ),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeightHelper.regular,
                            color: ColorsManager.grey,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsManager.grey,
                            decorationThickness: 2.0,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpace(161),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.language, color: ColorsManager.grey),
                    horizontalSpace(8),
                    Text("English", style: TextStyles.font12regulargrey),
                    horizontalSpace(8),
                    Icon(Icons.arrow_drop_down, color: ColorsManager.grey),
                  ],
                ),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Stay organized with",
                      style: TextStyles.font15regulargrey,
                    ),
                    horizontalSpace(8),
                    Image.asset('assets/icons/Symbol.png', height: 31.w),
                    Image.asset('assets/images/workiom.png', height: 31.w),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
