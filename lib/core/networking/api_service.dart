import 'package:dio/dio.dart';
import '../../features/second_screen_completing_sign_up/data/models/sign_up_request_body.dart';
import 'api_constants.dart';
import 'dio_factory.dart';

class ApiService {
  Dio dio = DioFactory.getDio();
  int requestDurationTime = 3;

  Future<TheResponse> signup(SignupRequestBody signupRequestBody) async {
    try {
      Response response = await dio.post(
        "${ApiConstants.apiBaseUrl}services/app/TenantRegistration/RegisterTenant",
        queryParameters: {"timeZone": "Europe/Istanbul"},
        options: Options(
          sendTimeout: Duration(minutes: requestDurationTime),
          receiveTimeout: Duration(minutes: requestDurationTime),
        ),
        data: signupRequestBody.toJson(),
      );
      TheResponse theResponse = TheResponse(statusCode: 200, body: 'succes');
      return theResponse;
    } on DioException catch (e) {
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        return TheResponse(body: e.response!.data["detail"], statusCode: 400);
      }
      return TheResponse(body: 'Could not connect to server', statusCode: 500);
    }
  }
}

class TheResponse {
  final int statusCode;
  final dynamic body;

  TheResponse({required this.statusCode, required this.body});
}
