
class SignupRequestBody {
  final String password,email,firstName,lastName,workSpaceName;

  SignupRequestBody({
    required this.email,
    required this.firstName,
    required this.password,
    required this.lastName,
    required this.workSpaceName
  });

  toJson() {
    return {
      'adminEmailAddress': email,
      'adminFirstName': firstName,
      'adminLastName': lastName,
      'adminPassword': password,
      'captchaResponse': null,
      'editionId': 16,
      'name': workSpaceName,
      'tenancyName':workSpaceName
    };
  }
}

