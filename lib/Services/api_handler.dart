import 'package:my_cart/Models/AuthScreenModels/SignUpModel.dart';
import 'package:my_cart/Models/AuthScreenModels/login_model.dart';
import 'package:my_cart/Services/api_service.dart';
import 'package:http/http.dart' as http;

import '../Utils/api_end_point.dart';
import 'api_exception.dart';

class ApiHandler {
  final ApiService apiService;

  ApiHandler(this.apiService);

  static ApiHandler createInstance() {
    return ApiHandler(ApiService(httpClient: http.Client()));
  }

  Future<SignUpModel> signUp(dynamic body) async {
    try {
      Map<String, dynamic> json = await apiService.post(
        baseUrl,
        signUpApiEndPoint,
        body,
      );
      SignUpModel signUpModel = SignUpModel.fromJson(json);
      return signUpModel;
    } on CustomException {
      rethrow;
    }
  }

  Future<LoginModel> login(dynamic body) async {
    try {
      Map<String, dynamic> json = await apiService.post(
        baseUrl,
        loginApiEndPoint,
        body,
      );
      LoginModel loginModel = LoginModel.fromJson(json);
      return loginModel;
    } on CustomException {
      rethrow;
    }
  }
}
