import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/manger/home_screen_cubit/cubit/home_screen_state.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/data/models/employees_model.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/presentation/manger/home_screen_cubit/cubit/tasks_screens_state.dart';

import '../../../../../../core/helpers/api.dart';
import '../../../../../../core/utils/endpoints.dart';

class TasksScreenCubit extends Cubit<TasksScreensState> {
  TasksScreenCubit() : super(TasksScreensInitial());
  List<Data> dropDownItems=[];

  Future addTask(List<DateTime?> range,String title,String description,String employee)async{
    emit(AddTasksScreensLoading());
    try {
      var storage =const FlutterSecureStorage();
      String? token=await storage.read(key: "token");
      var data = await Api().post(
        token: token,
        url: EndPoints.baseUrl + EndPoints.addTasksEndpoint,
        body: {
          'name': title,
          'description':description,
          'status':"0",
          'start_date':"${range.first?.day}-${range.first?.month}-${range.first?.year}",
          'end_date':"${range.last?.day}-${range.last?.month}-${range.last?.year}",
          'employee_id':employee,

        },
      );
      emit(AddTasksScreensSuccess());
      if (kDebugMode) {
        print(data);
      }
      emit(GetEmpSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(AddTasksScreensFailed(errmsg: e.toString()));
    }
  }

  Future getEmployees() async {
    emit(GetEmpLoading());
    try {
      var storage =const FlutterSecureStorage();
      String? token=await storage.read(key: "token");
      var data = await Api().get(
        token: token,
        url: EndPoints.baseUrl + EndPoints.getEmpEndpoint,
      );
      dropDownItems=Employees.fromJson(data).data!;
      emit(GetEmpSuccess());
      if (kDebugMode) {
        print(data);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(GetEmpFailed(errmsg: e.toString()));
    }
  }
}
