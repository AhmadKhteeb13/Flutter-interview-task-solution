import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_workiom/core/helpers/extensions.dart';
import 'package:flutter_test_workiom/core/widgets/super_button.dart';
import 'package:flutter_test_workiom/features/first_screen_completing_sign_up/ui/widgets/password_validations.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/networking/api_service.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../second_screen_completing_sign_up/data/repos/second_screen_completing_sign_up_repo.dart';
import '../../second_screen_completing_sign_up/logic/cubit/second_screen_completing_sign_up_cubit.dart';
import '../../second_screen_completing_sign_up/ui/second_screen_completing_sign_up.dart';
import '../logic/cubit/first_screen_completing_sign_up_cubit.dart';

class FirstScreenCompletingSignUp extends StatefulWidget {
  const FirstScreenCompletingSignUp({super.key});

  @override
  State<FirstScreenCompletingSignUp> createState() =>
      _FirstScreenCompletingSignUpState();
}

class _FirstScreenCompletingSignUpState
    extends State<FirstScreenCompletingSignUp> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  String email = '', password = '';
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context
        .read<FirstScreenCompletingSignUpCubit>()
        .passwordController;
    setupPasswordControllerListener();
    context
        .read<FirstScreenCompletingSignUpCubit>()
        .emailController
        .addListener(() {
          setState(() {});
        });
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
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
                    "Enter a strong password",
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
                verticalSpace(40),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Form(
                    key: context
                        .read<FirstScreenCompletingSignUpCubit>()
                        .formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            "Your work email",
                            style: TextStyles.font15regularblack,
                          ),
                        ),
                        verticalSpace(15),
                        TextFormField(
                          controller: context
                              .read<FirstScreenCompletingSignUpCubit>()
                              .emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: ColorsManager.black,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                context
                                    .read<FirstScreenCompletingSignUpCubit>()
                                    .emailController
                                    .clear();
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Color(0xFF747474),
                              ),
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
                            labelStyle: TextStyles.font15regularblack,
                            errorStyle: TextStyle(color: ColorsManager.red),
                          ),
                          style: TextStyles.font15regularblack,
                          validator: (value) {
                            if (value == null ||
                                !AppRegex.isEmailValid(value)) {
                              return 'Please enter a valid email';
                            }

                            return null;
                          },
                        ),
                        verticalSpace(24),
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            "Your password",
                            style: TextStyles.font15regularblack,
                          ),
                        ),
                        verticalSpace(15),
                        TextFormField(
                          controller: context
                              .read<FirstScreenCompletingSignUpCubit>()
                              .passwordController,
                          decoration: InputDecoration(
                            hintText: "***********",
                            hintStyle: TextStyles.font15regularblack,
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: ColorsManager.black,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Color(0xFF747474),
                              ),
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
                            labelStyle: TextStyles.font15regularblack,
                            errorStyle: TextStyle(color: ColorsManager.red),
                          ),
                          obscureText: isObscureText,
                          style: TextStyles.font15regularblack,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 14.w, right: 14.w),
                          child: PasswordValidations(
                            hasLowerCase: hasLowercase,
                            hasUpperCase: hasUppercase,
                            hasSpecialCharacters: hasSpecialCharacters,
                            hasNumber: hasNumber,
                            hasMinLength: hasMinLength,
                          ),
                        ),
                        verticalSpace(30),
                        SuperButton(
                          text: "Confirm password",
                          onPressed: () {
                            email = context
                                .read<FirstScreenCompletingSignUpCubit>()
                                .emailController
                                .text;
                            password = context
                                .read<FirstScreenCompletingSignUpCubit>()
                                .passwordController
                                .text;

                            if (hasLowercase &&
                                hasUppercase &&
                                hasSpecialCharacters &&
                                hasNumber &&
                                hasMinLength &&
                                context
                                    .read<FirstScreenCompletingSignUpCubit>()
                                    .formKey
                                    .currentState!
                                    .validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider.value(
                                        value:
                                            SecondScreenCompletingSignUpCubit(
                                              SecondScreenCompletingSignUpRepo(
                                                ApiService(),
                                              ),
                                            ),
                                      ),
                                    ],
                                    child: SecondScreenCompletingSignUp(
                                      email: email,
                                      password: password,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          isLoading: false,
                          backgroundColor:
                              (hasLowercase &&
                                  hasUppercase &&
                                  hasSpecialCharacters &&
                                  hasNumber &&
                                  hasMinLength &&
                                  context
                                      .read<FirstScreenCompletingSignUpCubit>()
                                      .formKey
                                      .currentState!
                                      .validate())
                              ? ColorsManager.primaryBlueColor
                              : Color(0xFFB5B5B5),
                          foregroundColor: ColorsManager.white,
                          borderRadius: 16.r,
                          padding: EdgeInsets.only(
                            top: 15.h,
                            bottom: 14.h,
                            left: 50.w,
                          ),
                          width: 343.w,
                          height: 53.h,
                          icon: Image.asset('assets/icons/enter.png'),
                          iconPosition: SuperButton.end,
                          iconSpacing: 62.5.w,
                        ),
                        verticalSpace(100.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Stay organized with",
                              style: TextStyles.font15regulargrey,
                            ),
                            horizontalSpace(8),
                            Image.asset(
                              'assets/icons/Symbol.png',
                              height: 31.w,
                            ),
                            Image.asset(
                              'assets/images/workiom.png',
                              height: 31.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
