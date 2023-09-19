import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/data/models/department_model.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class GetAllDepartmentsRepo {
  static Future<List<DepartmentModel>> getAllDepartments() async {
    final Map<String,dynamic> data = await Api.get(
        url: EndPoints.baseUrl + EndPoints.getAllDepartmentsEndpoint,
        token: token);
    return data['data']
        .map((department) => DepartmentModel.fromJson(department))
        .toList()
        .cast<DepartmentModel>();
  }
}
