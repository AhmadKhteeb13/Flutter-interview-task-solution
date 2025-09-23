import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_workiom/features/first_screen_completing_sign_up/data/repos/first_screen_completing_sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'first_screen_completing_sign_up_state.dart';

class FirstScreenCompletingSignUpCubit
    extends Cubit<FirstScreenCompletingSignUpState> {
  FirstScreenCompletingSignUpCubit(this._firstScreenCompletingSignUpRepo)
    : super(FirstScreenCompletingSignUpInitial());
  final FirstScreenCompletingSignUpRepo _firstScreenCompletingSignUpRepo;
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
