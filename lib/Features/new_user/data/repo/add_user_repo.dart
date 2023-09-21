import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class AddUserRepo {
  static Future<void> addUser(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String userType}) async {
    var storage =const FlutterSecureStorage();
    String? token=await storage.read(key: "token");
    await Api().post(
        url: EndPoints.baseUrl + EndPoints.addUserEndpoint,
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'user_type': userType
        },
        token: token);
  }
}
