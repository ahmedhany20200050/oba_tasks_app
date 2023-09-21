import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/data/models/admin_dep_model.dart';
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
  List<AdminDepModel> listOfDeps = [];

  deleteTask({required String taskid}) async {
    token = await SecureStorage.getData(key: 'token');
    emit(AdminDeleteTaskLoading());
    await Api()
        .delete(
      url: EndPoints.baseUrl + EndPoints.taskDeleteEndpoint + taskid,
      token: token,
    )
        .then((value) {
      if (value == 500) {
        SecureStorage.deleteData(key: 'token');
        emit(AdminGetAllTasks(code: value));
      } else {
        emit(AdminDeleteTaskSuccess());
      }
    });
  }

  deleteUser({required String userid}) async {
    token = await SecureStorage.getData(key: 'token');
    emit(AdminDeleteUserLoading());
    await Api()
        .delete(
      url: EndPoints.baseUrl + EndPoints.userDeleteEndpoint + userid,
      token: token,
    )
        .then((value) {
      if (value == 500) {
        SecureStorage.deleteData(key: 'token');
        emit(AdminGetAllTasks(code: value));
      } else if (value == 422) {
        emit(AdminDeleteUserFailure(errmsg: 'You can\'t delete this user.'));
      } else {
        emit(AdminDeleteUserSuccess());
      }
    });
  }

  deleteDep({required String depid}) async {
    token = await SecureStorage.getData(key: 'token');
    emit(AdminDeleteDepLoading());
    await Api()
        .delete(
      url: EndPoints.baseUrl + EndPoints.depDeleteEndpoint + depid,
      token: token,
    )
        .then((value) {
      if (value == 500) {
        SecureStorage.deleteData(key: 'token');
        emit(AdminGetAllTasks(code: value));
      } else if (value == 422) {
        emit(AdminDeleteDepFailure(
            errmsg: 'You can\'t delete this department.'));
      } else {
        emit(AdminDeleteDepSuccess());
      }
    });
  }

  adminAllTasks() async {
    listOfTasks.clear();
    usertype = await SecureStorage.getData(key: 'userType');
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

  adminAllDeparts() async {
    listOfDeps.clear();
    usertype = await SecureStorage.getData(key: 'userType');
    token = await SecureStorage.getData(key: 'token');
    await Api()
        .get(
      url: EndPoints.baseUrl + EndPoints.allDepsEndpoint,
      token: token,
    )
        .then((value) {
      if (value == 500) {
        SecureStorage.deleteData(key: 'token');
        emit(AdminGetAllDeps(code: value));
      } else {
        for (var element in value['data']) {
          listOfDeps.add(AdminDepModel.fromJson(element));
        }
        emit(AdminGetAllDeps());
      }
    });
  }

  logout(context) async {
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
          SecureStorage.deleteData(key: 'userType');
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
        } else {
          SecureStorage.deleteData(key: 'token');
          SecureStorage.deleteData(key: 'userType');
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
