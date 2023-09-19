import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/core/data/models/user_model.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class GetAllEmployeesRepo {
  static Future<List<UserModel>> getAllEmployees() async {
    final Map<String, dynamic> data = await Api.get(
        url: EndPoints.baseUrl + EndPoints.showEmployeesEndpoint, token: token);
    print(data);
    return data['data']
        .map((employee) => UserModel.fromJson(employee))
        .toList()
        .cast<UserModel>();
  }
}
