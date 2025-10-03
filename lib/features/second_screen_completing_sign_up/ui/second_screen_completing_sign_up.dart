import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_workiom/core/helpers/extensions.dart';
import 'package:flutter_test_workiom/core/widgets/super_button.dart';
import 'package:flutter_test_workiom/features/second_screen_completing_sign_up/ui/widgets/sign_up_bloc_listener.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../logic/cubit/second_screen_completing_sign_up_cubit.dart';

class SecondScreenCompletingSignUp extends StatefulWidget {
  const SecondScreenCompletingSignUp({
    super.key,
    required this.email,
    required this.password,
  });
  final String email, password;

  @override
  State<SecondScreenCompletingSignUp> createState() =>
      _SecondScreenCompletingSignUpState();
}

class _SecondScreenCompletingSignUpState
    extends State<SecondScreenCompletingSignUp> {
  bool isAvailable = false,
      isWorkspaceNameError = false,
      workspaceNameIsValidate = true,
      isFirstNameError = false,
      firstNameIsValidate = true,
      isLastNameError = false,
      lastNameIsValidate = true;
  @override
  void initState() {
    super.initState();

    context
        .read<SecondScreenCompletingSignUpCubit>()
        .emitGetEditionsForSelect();

    context
        .read<SecondScreenCompletingSignUpCubit>()
        .workspaceNameController
        .addListener(() {
          setState(() {});
        });
    context
        .read<SecondScreenCompletingSignUpCubit>()
        .firstNameController
        .addListener(() {
          setState(() {});
        });
    context
        .read<SecondScreenCompletingSignUpCubit>()
        .lastNameController
        .addListener(() {
          setState(() {});
        });
  }

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
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: ColorsManager.primaryBlueColor,
                        ),
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
                    "Enter your company name",
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
                verticalSpace(80),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Form(
                    key: context
                        .read<SecondScreenCompletingSignUpCubit>()
                        .formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            "Your company or team name",
                            style: TextStyles.font15regularblack,
                          ),
                        ),
                        verticalSpace(15),
                        TextFormField(
                          controller: context
                              .read<SecondScreenCompletingSignUpCubit>()
                              .workspaceNameController,
                          decoration: InputDecoration(
                            hintText: 'Workspace name*',
                            suffixText: ".workiom.com",
                            suffixStyle: TextStyle(
                              color: Color(0xFF747474),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: Icon(
                              Icons.group_outlined,
                              color: ColorsManager.black,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD6D6D6)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD6D6D6)),
                            ),
                            hintStyle: TextStyles.font15regularblack,
                            errorStyle: TextStyle(color: ColorsManager.red),
                          ),
                          style: TextStyles.font15regularblack,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                workspaceNameIsValidate = false;
                                isWorkspaceNameError = true;
                              });
                              return "Please fill in the field";
                            }
                            setState(() {
                              workspaceNameIsValidate = true;
                              isWorkspaceNameError = false;
                            });
                            return null;
                          },
                        ),
                        verticalSpace(24),
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            "Your first name",
                            style: TextStyles.font15regularblack,
                          ),
                        ),
                        verticalSpace(15),
                        TextFormField(
                          controller: context
                              .read<SecondScreenCompletingSignUpCubit>()
                              .firstNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Enter your First name',
                            prefixIcon: Icon(
                              Icons.notes_outlined,
                              color: ColorsManager.black,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD6D6D6)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD6D6D6)),
                            ),
                            hintStyle: TextStyles.font15regularblack,
                            errorStyle: TextStyle(color: ColorsManager.red),
                          ),
                          style: TextStyles.font15regularblack,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                firstNameIsValidate = false;
                                isFirstNameError = true;
                              });
                              return "Please fill in the field";
                            }
                            setState(() {
                              firstNameIsValidate = true;
                              isFirstNameError = false;
                            });
                            return null;
                          },
                        ),

                        verticalSpace(24),
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            "Your last name",
                            style: TextStyles.font15regularblack,
                          ),
                        ),
                        verticalSpace(15),
                        TextFormField(
                          controller: context
                              .read<SecondScreenCompletingSignUpCubit>()
                              .lastNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Enter your Last name',
                            prefixIcon: Icon(
                              Icons.notes_outlined,
                              color: ColorsManager.black,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD6D6D6)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD6D6D6)),
                            ),
                            hintStyle: TextStyles.font15regularblack,
                            errorStyle: TextStyle(color: ColorsManager.red),
                          ),
                          style: TextStyles.font15regularblack,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                lastNameIsValidate = false;
                                isLastNameError = true;
                              });
                              return "Please fill in the field";
                            }
                            setState(() {
                              lastNameIsValidate = true;
                              isLastNameError = false;
                            });
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                verticalSpace(28),
                SuperButton(
                  text: "Create Workspace",
                  onPressed: () {
                    if (context
                        .read<SecondScreenCompletingSignUpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context
                              .read<SecondScreenCompletingSignUpCubit>()
                              .emailController
                              .text =
                          widget.email;
                      context
                              .read<SecondScreenCompletingSignUpCubit>()
                              .passwordController
                              .text =
                          widget.password;
                      context
                          .read<SecondScreenCompletingSignUpCubit>()
                          .emitSignUpStates();
                    }
                  },
                  isLoading: false,
                  backgroundColor:
                      (context
                              .read<SecondScreenCompletingSignUpCubit>()
                              .formKey
                              .currentState !=
                          null)
                      ? (context
                                .read<SecondScreenCompletingSignUpCubit>()
                                .formKey
                                .currentState!
                                .validate())
                            ? ColorsManager.primaryBlueColor
                            : Color(0xFFB5B5B5)
                      : Color(0xFFB5B5B5),
                  foregroundColor: ColorsManager.white,
                  borderRadius: 16.r,
                  padding: EdgeInsets.only(top: 15.h, bottom: 14.h, left: 50.w),
                  width: 343.w,
                  height: 53.h,
                  icon: Image.asset('assets/icons/enter.png'),
                  iconPosition: SuperButton.end,
                  iconSpacing: 62.5.w,
                ),
                SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
