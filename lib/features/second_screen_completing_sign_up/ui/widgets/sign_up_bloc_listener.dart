import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_workiom/core/helpers/extensions.dart';
import '../../../../core/routing/routers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/second_screen_completing_sign_up_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      SecondScreenCompletingSignUpCubit,
      SecondScreenCompletingSignUpState
    >(
      listenWhen: (previous, current) =>
          current is LoadingSignUp ||
          current is SuccessSignUp ||
          current is FaildSignUp,
      listener: (context, state) {
        if (state is LoadingSignUp) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryBlueColor,
              ),
            ),
          );
        }

        if (state is SuccessSignUp) {
          context.pop();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Signup Successful"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("Account has been successfully registered"),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      disabledForegroundColor: Colors.grey.withOpacity(0.38),
                    ),
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(
                        Routes.successScreen,
                        predicate: (Route<dynamic> route) => false,
                      );
                    },
                    child: Text("Continue"),
                  ),
                ],
              );
            },
          );
        }

        if (state is FaildSignUp) {
          setupErrorState(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font17regularPrimaryBlueColor),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Got it",
              style: TextStyles.font17regularPrimaryBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
