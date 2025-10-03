part of 'second_screen_completing_sign_up_cubit.dart';

@immutable
sealed class SecondScreenCompletingSignUpState {}

final class SecondScreenCompletingSignUpInitial extends SecondScreenCompletingSignUpState {}

class SuccessSignUp extends SecondScreenCompletingSignUpState {
}

class LoadingSignUp extends SecondScreenCompletingSignUpState {}

class FaildSignUp extends SecondScreenCompletingSignUpState {
  final String error;
  FaildSignUp(this.error);
}

class SuccessGetEditionsForSelect extends SecondScreenCompletingSignUpState {
  final EditionsResponse editions;

  SuccessGetEditionsForSelect(this.editions);
}

class LoadingGetEditionsForSelect extends SecondScreenCompletingSignUpState {}

class GetEditionsForSelectIsEmpty extends SecondScreenCompletingSignUpState {}

class SomethingIsWrong extends SecondScreenCompletingSignUpState {
  final String error;
  SomethingIsWrong(this.error);
}

class FaildGetEditionsForSelect extends SecondScreenCompletingSignUpState {
  final String error;
  FaildGetEditionsForSelect(this.error);
}
