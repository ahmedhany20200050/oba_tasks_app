// ignore_for_file: missing_required_param
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/data/models/login_user_model.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

late String token;

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  LoginUserModel? model;

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
      SecureStorage.writeData(key: "token", value: data['data']['token']) ;
      model = LoginUserModel.fromJson(data);
      token=data['data']['token'];
    } on Exception catch (e) {
      emit(LoginCubitFailure(errmsg: e.toString()));
    }
  }
}
