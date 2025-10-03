import '../../../../core/networking/api_service.dart';
import '../models/sign_up_request_body.dart';

class SecondScreenCompletingSignUpRepo {
  final ApiService _apiService;
  SecondScreenCompletingSignUpRepo(this._apiService);
  Future<TheResponse> signup(SignupRequestBody signupRequestBody) async {
    try {
      final theResponse = await _apiService.signup(signupRequestBody);
      return theResponse;
    } catch (error) {
      return TheResponse(statusCode: 500, body: error.toString());
    }
  }

  Future<TheResponse> getEditionsForSelect() async {
    try {
      final theResponse = await _apiService.getEditionsForSelect();
      return theResponse;
    } catch (error) {
      return TheResponse(statusCode: 500, body: error.toString());
    }
  }
}
