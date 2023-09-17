// ignore_for_file: missing_required_param
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

createDepartment({required String name}) async {
  await Api().post(
    url: EndPoints.baseUrl + EndPoints.depStoreEndpoint,
    body: {
      'name': name,
    },
    token: token,
  );
}

updateDepartment(
    {required String depId,
    required String depName,
    required String managerId}) async {
  await Api().post(
    url: EndPoints.baseUrl + EndPoints.depStoreEndpoint + depId,
    body: {
      'name': depName,
      'manager_id': managerId,
    },
    token: token,
  );
}

createUser({
  required String name,
  required String email,
  required int phone,
  required String password,
  required String userType,
  required String depId,
}) async {
  await Api().post(
    url: EndPoints.baseUrl + EndPoints.userStoreEndpoint,
    body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'user_type': userType,
      'department_id': depId,
    },
    token: token,
  );
}

updateUser({
  required String userId,
  required String name,
  required String email,
  required int phone,
  required String password,
  required String userType,
  required String userStatus,
  required String depId,
}) async {
  await Api().post(
    url: EndPoints.baseUrl + EndPoints.userUpdateEndpoint + userId,
    body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'user_type': userType,
      'user_status': userStatus,
      'department_id': depId,
    },
    token: token,
  );
}
