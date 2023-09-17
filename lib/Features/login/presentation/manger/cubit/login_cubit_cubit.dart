// ignore_for_file: missing_required_param
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';


class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitLoading());
  late String token;
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
      var storage = const FlutterSecureStorage();
      await storage.write(key: "token", value: token);
      // print(token);
    } on Exception catch (e) {
      emit(LoginCubitFailure(errmsg: e.toString()));
    }
  }

  Future goDirectlyToNextScreen()async{
    var storage=await SharedPreferences.getInstance();
    bool go= storage.getBool("keepMeLoggedIn")??false;
    if(go){
      emit(LoginCubitSuccess());
    }else{
      emit(LoginCubitInitial());
    }
  }
}
