import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_task/data/models/employ_model.dart';
import 'package:tasks_app_eraasoft/Features/create_task/presentation/manger/cubit/create_task_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit() : super(CreateTaskInitial());

  List<EmployeeModel> listOfEmploys = [];
  List<int> employsID = [];
  int? selctedId;
  String? selctedname;
  String? token;

  Future createTask({
    required String name,
    required String description,
    required String startDate,
    required String endDate,
    required String employID,
  }) async {
    emit(CreateTaskLoading());
    token = await SecureStorage.getData(key: 'token');
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.taskStoreEndpoint,
        body: {
          'name': name,
          'description': description,
          'status': "0",
          'start_date': startDate,
          'end_date': endDate,
          'employee_id': employID,
        },
        token: token,
      );
      emit(CreateTaskSuccess());
    } on Exception catch (e) {
      emit(CreateTaskFailure(errmsg: e.toString()));
    }
  }

  Future getAllEmployees() async {
    listOfEmploys.clear();
    employsID.clear();
    token = await SecureStorage.getData(key: 'token');
    var data = await Api().get(
      url: EndPoints.baseUrl + EndPoints.allEmployeesEndpoint,
      token: token,
    );
    for (var element in data["data"]) {
      if (element['user_type'] == 'employee' && element['department_id'] != 0) {
        listOfEmploys.add(EmployeeModel.fromJson(element));
      }
    }

    for (var element in listOfEmploys) {
      employsID.add(element.id!);
    }
  }
}
