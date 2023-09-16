// ignore_for_file: missing_required_param
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';



login({required String email, required String password}) async {
  await Api().post(
    url: EndPoints.baseUrl + EndPoints.loginEndpoint,
    body: {
      'email': email,
      'password': password,
    },
  );
}

logout() async {
  await Api().post(
    url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
  );
}

