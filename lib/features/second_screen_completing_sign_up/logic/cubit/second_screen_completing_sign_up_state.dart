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
