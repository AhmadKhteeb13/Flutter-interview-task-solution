import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        Container(
          width: 343.w,
          height: 7.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child:
                [
                      hasLowerCase,
                      hasUpperCase,
                      hasSpecialCharacters,
                      hasNumber,
                      hasMinLength,
                    ].where((b) => b).length ==
                    5
                ? LinearProgressIndicator(
                    value: 1,
                    minHeight: 15,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsManager.green,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  )
                : [
                        hasLowerCase,
                        hasUpperCase,
                        hasSpecialCharacters,
                        hasNumber,
                        hasMinLength,
                      ].where((b) => b).length >=
                      2
                ? LinearProgressIndicator(
                    value: 0.6,
                    minHeight: 15,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsManager.amber,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  )
                : LinearProgressIndicator(
                    value: 0.1,
                    minHeight: 15,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsManager.red,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
          ),
        ),

        verticalSpace(9),
        Row(
          children: [
            [
                      hasLowerCase,
                      hasUpperCase,
                      hasSpecialCharacters,
                      hasNumber,
                      hasMinLength,
                    ].where((b) => b).length ==
                    5
                ? Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      horizontalSpace(8),
                      Text(
                        "Not enought strong",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.black,
                        ),
                      ),
                    ],
                  )
                : [
                        hasLowerCase,
                        hasUpperCase,
                        hasSpecialCharacters,
                        hasNumber,
                        hasMinLength,
                      ].where((b) => b).length >=
                      2
                ? Row(
                    children: [
                      Icon(Icons.warning_rounded, color: Colors.orange),
                      horizontalSpace(8),
                      Text(
                        "Not enought strong",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.black,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Icon(Icons.cancel_rounded, color: Colors.red),
                      horizontalSpace(8),
                      Text(
                        'Very weak',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.black,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
        verticalSpace(5),
        buildValidationRow("At least one lowercase ('a'-'z')", hasLowerCase),
        verticalSpace(5),
        buildValidationRow("At least one uppercase ('A'-'Z').", hasUpperCase),
        verticalSpace(5),
        buildValidationRow(
          'At least one special character',
          hasSpecialCharacters,
        ),
        verticalSpace(5),
        buildValidationRow('At least one number', hasNumber),
        verticalSpace(5),
        buildValidationRow('At least 7 characters', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        hasValidated
            ? Icon(Icons.check, color: Colors.green)
            : Icon(Icons.close, color: Colors.red),
        horizontalSpace(8),
        Text(text, style: TextStyles.font12regulargrey),
      ],
    );
  }
}
