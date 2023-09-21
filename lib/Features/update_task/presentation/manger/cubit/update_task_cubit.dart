import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_task/data/models/employ_model.dart';
import 'package:tasks_app_eraasoft/Features/update_department/data/models/dep_model.dart';
import 'package:tasks_app_eraasoft/Features/update_task/presentation/manger/cubit/update_task_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit() : super(UpdateTaskInitial());

  List<EmployeeModel> listOfEmploys = [];
  List<int> employsID = [];
  List<DepModel> listOfDeps = [];
  List<int> depsID = [];
  String? token;
  String? taskID;
  int? radioSelection;

  radioSelectionChange(int? value) {
    radioSelection = value;
    emit(RadioSelectionChange());
  }

  Future updateTask({
    required String taskId,
    required String name,
    required String status,
    required String description,
    required String startDate,
    required String endDate,
    required String depID,
    required String employID,
  }) async {
    emit(UpdateTaskLoading());
    token = await SecureStorage.getData(key: 'token');
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.taskUpdateEndpoint + taskId,
        body: {
          'name': name,
          'description': description,
          'status': status,
          'start_date': startDate,
          'end_date': endDate,
          'department_id': depID,
          'employee_id': employID,
        },
        token: token,
      );
      emit(UpdateTaskSuccess());
    } on Exception catch (e) {
      emit(UpdateTaskFailure(errmsg: e.toString()));
    }
  }

  Future allEmployees() async {
    listOfEmploys.clear();
    employsID.clear();
    taskID = await SecureStorage.getData(key: 'taskid');
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

  allDepartments() async {
    listOfDeps.clear();
    depsID.clear();
    taskID = await SecureStorage.getData(key: 'taskid');
    token = await SecureStorage.getData(key: 'token');
    var alldepsdata = await Api().get(
      url: EndPoints.baseUrl + EndPoints.allDepsEndpoint,
      token: token,
    );
    for (var element in alldepsdata['data']) {
      listOfDeps.add(DepModel.fromJson(element));
    }
    for (var element in listOfDeps) {
      depsID.add(element.id!);
    }
  }
}
