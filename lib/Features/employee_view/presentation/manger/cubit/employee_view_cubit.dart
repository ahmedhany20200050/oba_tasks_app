import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/data/models/task_model.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/manger/cubit/employee_view_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class EmployeeViewCubit extends Cubit<EmployeeViewStates> {
  EmployeeViewCubit() : super(EmployeeViewInitial());
  int? radioSelection;
  String? token;
  List<TaskModel> listOfTasks = [];

  radioSelectionChange(int value) {
    radioSelection = value;
    emit(RadioSelectionChange());
  }

  employeeUpdateTask({
    required context,
    required int taskID,
    required String name,
    required String description,
    required String startDate,
    required String endDate,
    required String status,
    required String employID,
    required String depID,
  }) async {
    listOfTasks.clear();
    emit(EmployeeUpdateTaskLoading());
    token = await SecureStorage.getData(key: 'token');
    try {
      await Api()
          .post(
              url: "${EndPoints.baseUrl}${EndPoints.taskUpdateEndpoint}$taskID",
              body: {
                'name': name,
                'description': description,
                'status': status,
                'start_date': startDate,
                'end_date': endDate,
                'employee_id': employID,
                'department_id': depID
              },
              token: token)
          .then((value) {
        if (value == 500) {
          SecureStorage.deleteData(key: 'token');
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.id, (route) => false);
        }
        emit(EmployeeUpdateTaskSuccess());
      });
    } on Exception catch (e) {
      emit(EmployeeUpdateTaskFailure(errmsg: e.toString()));
    }
  }

  Future logout(context) async {
    emit(EmployeeLogoutLoading());
    token = await SecureStorage.getData(key: 'token');
    try {
      await Api()
          // ignore: missing_required_param
          .post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
        token: token,
      )
          .then((value) {
        if (value == 500) {
          SecureStorage.deleteData(key: 'token');
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
        } else {
          SecureStorage.deleteData(key: 'token');
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
          emit(EmployeeLogoutSuccess());
        }
      });

      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(EmployeeLogoutFailure(errmsg: e.toString()));
    }
  }

  Future employeeAllTasks() async {
    token = await SecureStorage.getData(key: 'token');
    await Api()
        .get(
      url: EndPoints.baseUrl + EndPoints.allTasksEndpoint,
      token: token,
    )
        .then((value) {
      if (value == 500) {
        SecureStorage.deleteData(key: 'token');
        emit(EmployeeGetAllTasks(code: value));
      } else {
        for (var element in value['data']) {
          listOfTasks.add(TaskModel.fromJson(element));
        }
        emit(EmployeeGetAllTasks());
      }
    });
  }
}
