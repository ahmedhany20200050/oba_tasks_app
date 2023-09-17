import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/manger/cubit/create_user_state.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());

  Future createUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String userType,
    required String depId,
  }) async {
    emit(CreateUserLoading());
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.userStoreEndpoint,
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'user_type': userType,
          'department_id': depId,
        },
        token: token,
      );
      emit(CreateUserSuccess());
    } on Exception catch (e) {
      emit(CreateUserFailure(errmsg: e.toString()));
    }
  }
}
