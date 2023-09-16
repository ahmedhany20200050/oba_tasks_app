// ignore_for_file: missing_required_param
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  login({required String email, required String password}) async {
    emit(LoginCubitLoading());
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.loginEndpoint,
        body: {
          'email': email,
          'password': password,
        },
      );
      emit(LoginCubitSuccess());
    } on Exception catch (e) {
      emit(LoginCubitFailure());
    }
  }
}
