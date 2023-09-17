import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/data/models/department_model.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class GetAllDepartmentsRepo {
  static Future<List<DepartmentModel>> getAllDepartments() async{
    var data = await Api.get(
        url: EndPoints.baseUrl + EndPoints.getAllDepartmentsEndpoint,
        token: token
      );
    List<DepartmentModel> departments = [];
      data['data'].forEach((element) {
        departments.add(DepartmentModel.fromJson(element));
      });
      return departments;
  }
}
