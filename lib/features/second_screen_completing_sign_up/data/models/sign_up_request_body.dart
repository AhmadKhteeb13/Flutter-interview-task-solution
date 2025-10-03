class SignupRequestBody {
  final String password, email, firstName, lastName, workSpaceName;
  final int editionId;
  SignupRequestBody({
    required this.email,
    required this.firstName,
    required this.password,
    required this.lastName,
    required this.workSpaceName,
    required this.editionId
  });

  toJson() {
    return {
      'adminEmailAddress': email,
      'adminFirstName': firstName,
      'adminLastName': lastName,
      'adminPassword': password,
      'captchaResponse': null,
      'editionId': editionId,
      'name': workSpaceName,
      'tenancyName': workSpaceName,
    };
  }
}
