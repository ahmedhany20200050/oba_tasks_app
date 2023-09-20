import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/data/models/task_model.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class AdminViewCubit extends Cubit<AdminViewStates> {
  AdminViewCubit() : super(AdminViewInitial());
  String? token;
  String? usertype;
  List<TaskModel> listOfTasks = [];

  Future adminAllTasks() async {
  usertype=  await SecureStorage.getData(key: 'userType');
    token = await SecureStorage.getData(key: 'token');
    await Api()
        .get(
      url: EndPoints.baseUrl + EndPoints.allTasksEndpoint,
      token: token,
    )
        .then((value) {
      if (value == 500) {
        SecureStorage.deleteData(key: 'token');
        emit(AdminGetAllTasks(code: value));
      } else {
        for (var element in value['data']) {
          listOfTasks.add(TaskModel.fromJson(element));
        }
        emit(AdminGetAllTasks());
      }
    });
  }

  Future logout(context) async {
    emit(AdminLogoutLoading());
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
          emit(AdminLogoutSuccess());
        }
      });

      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(AdminLogoutFailure(errmsg: e.toString()));
    }
  }
}
