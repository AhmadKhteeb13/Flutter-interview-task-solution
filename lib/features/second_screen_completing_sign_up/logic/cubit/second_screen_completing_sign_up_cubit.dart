import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_workiom/features/second_screen_completing_sign_up/data/models/sign_up_request_body.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/api_service.dart';
import '../../../sing_up/data/models/editions_response.dart';
import '../../data/repos/second_screen_completing_sign_up_repo.dart';

part 'second_screen_completing_sign_up_state.dart';

class SecondScreenCompletingSignUpCubit
    extends Cubit<SecondScreenCompletingSignUpState> {
  SecondScreenCompletingSignUpCubit(this._secondScreenCompletingSignUpRepo)
    : super(SecondScreenCompletingSignUpInitial());
  final SecondScreenCompletingSignUpRepo _secondScreenCompletingSignUpRepo;
  TextEditingController workspaceNameController = TextEditingController(),
      firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  int _editionId = 0;
  void emitGetEditionsForSelect() async {
    emit(LoadingGetEditionsForSelect());
    TheResponse getEditionsForSelectState =
        await _secondScreenCompletingSignUpRepo.getEditionsForSelect();
    if (getEditionsForSelectState.statusCode == 200) {
      for (EditionWithFeatures editionWithFeatures
          in getEditionsForSelectState.body.result.editionsWithFeatures) {
        if (editionWithFeatures.edition!.isRegistrable!) {
          _editionId = editionWithFeatures.edition!.id!;
          break;
        }
      }
      emit(SuccessGetEditionsForSelect(getEditionsForSelectState.body));
    } else if (getEditionsForSelectState.statusCode == 400) {
      emit(
        FaildGetEditionsForSelect(getEditionsForSelectState.body.toString()),
      );
    } else {
      emit(
        FaildGetEditionsForSelect(getEditionsForSelectState.body.toString()),
      );
    }
  }

  void emitSignUpStates() async {
    emit(LoadingSignUp());
    TheResponse response = await _secondScreenCompletingSignUpRepo.signup(
      SignupRequestBody(
        email: emailController.text,
        firstName: firstNameController.text,
        password: passwordController.text,
        lastName: lastNameController.text,
        workSpaceName: workspaceNameController.text,
        editionId: _editionId,
      ),
    );

    if (response.statusCode == 200) {
      emit(SuccessSignUp());
    } else if (response.statusCode == 400) {
      emit(FaildSignUp(response.body.toString()));
    } else {
      emit(FaildSignUp(response.body.toString()));
    }
  }
}
