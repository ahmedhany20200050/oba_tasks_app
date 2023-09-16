// ignore_for_file: missing_required_param
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

late String token;

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  Future login({required String email, required String password}) async {
    emit(LoginCubitLoading());
    try {
      var data = await Api().post(
        url: EndPoints.baseUrl + EndPoints.loginEndpoint,
        body: {
          'email': email,
          'password': password,
        },
      );
      emit(LoginCubitSuccess());
      token = data['data']['token'];
      print(token);
    } on Exception catch (e) {
      emit(LoginCubitFailure(errmsg: e.toString()));
    }
  }
}
