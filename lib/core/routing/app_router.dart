import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_workiom/core/networking/api_service.dart';
import 'package:flutter_test_workiom/features/first_screen_completing_sign_up/data/repos/first_screen_completing_sign_up_repo.dart';
import 'package:flutter_test_workiom/features/first_screen_completing_sign_up/logic/cubit/first_screen_completing_sign_up_cubit.dart';
import 'package:flutter_test_workiom/features/sing_up/data/repos/sign_up_repo.dart';
import 'package:flutter_test_workiom/features/first_screen_completing_sign_up/ui/first_screen_completing_sign_up.dart';
import 'package:flutter_test_workiom/features/sing_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_test_workiom/features/sing_up/ui/sign_up.dart';
import '../../features/second_screen_completing_sign_up/data/repos/second_screen_completing_sign_up_repo.dart';
import '../../features/second_screen_completing_sign_up/logic/cubit/second_screen_completing_sign_up_cubit.dart';
import '../../features/second_screen_completing_sign_up/ui/second_screen_completing_sign_up.dart';
import '../../features/success_screen/ui/success_screen.dart';
import 'routers.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SignUpCubit>(
                create: (_) => SignUpCubit(SignUpRepo(ApiService())),
              ),
            ],
            child: SignUp(),
          ),
        );

      case Routes.firstScreenCompletingSignUp:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: FirstScreenCompletingSignUpCubit(
                  FirstScreenCompletingSignUpRepo(ApiService()),
                ),
              ),
            ],
            child: const FirstScreenCompletingSignUp(),
          ),
        );
      case Routes.secondScreenCompletingSignUp:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: SecondScreenCompletingSignUpCubit(
                  SecondScreenCompletingSignUpRepo(ApiService()),
                ),
              ),
            ],
            child: const SecondScreenCompletingSignUp(email: '', password: ''),
          ),
        );

      case Routes.successScreen:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SignUpCubit>(
                create: (_) => SignUpCubit(SignUpRepo(ApiService())),
              ),
            ],
            child: SignUp(),
          ),
        );
    }
  }
}
