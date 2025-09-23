import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_workiom/core/helpers/spacing.dart';

import '../../../core/theming/styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

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
                verticalSpace(310),
                Padding(
                  padding: EdgeInsets.only(left: 60.w, right: 60.w),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0E0F12),
                      ),
                      children: [
                        const TextSpan(
                          text: "Thank you for choosing\nWorkiom ",
                        ),
                        // const TextSpan(
                        //   text: "Workiom ",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Image.asset(
                            'assets/icons/Symbol.png',
                            height: 31.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(310),
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
