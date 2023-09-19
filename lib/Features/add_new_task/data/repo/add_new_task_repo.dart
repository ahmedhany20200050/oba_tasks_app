import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class AddNewTaskRepo {
  static void addNewTask(
      {required String name,
      required String description,
      required String startDate,
      required String endDate,
      required String employeeId}) async{
    Api.post(
        url: EndPoints.baseUrl + EndPoints.addNewTaskEndPoint,
        body: {
          'name': name,
          'description': description,
          'status': "0",
          'start_date': startDate,
          'end_date': endDate,
          'employee_id': employeeId
        },
        token: token);
  }
}
