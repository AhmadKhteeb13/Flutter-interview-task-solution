import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_test_workiom/features/sing_up/data/repos/sign_up_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/api_service.dart';
import '../../data/models/editions_response.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signupRepo) : super(SignUpInitial());
  final SignUpRepo _signupRepo;
}
