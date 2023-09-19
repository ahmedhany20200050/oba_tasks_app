import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/manger/cubit/user_tasks_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class UserTasksCubit extends Cubit<UserTasksState> {
  UserTasksCubit() : super(UserTasksInitial());
  String? token;

  Future logout(context) async {
    emit(TasksLogoutLoading());
    token = await SecureStorage.getData(key: 'token');
    try {
      // ignore: missing_required_param
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
        token: token,
      );
      SecureStorage.deleteData(key: 'token');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
      emit(TasksLogoutSuccess());
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(TasksLogoutFailure(errmsg: e.toString()));
      print(e);
    }
  }
}
