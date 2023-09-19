import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/manger/cubit/user_view_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class UserViewCubit extends Cubit<UserViewState> {
  UserViewCubit() : super(UserViewInitial());

  Future logout(context) async {
    emit(ViewLogoutLoading());
    await SecureStorage.getData(key: 'token');
    try {
      // ignore: missing_required_param
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
        token: SecureStorage.value,
      );
      SecureStorage.deleteData(key: 'token');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
      emit(ViewLogoutSuccess());
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(ViewLogoutFailure(errmsg: e.toString()));
      print(e);
    }
  }
}
