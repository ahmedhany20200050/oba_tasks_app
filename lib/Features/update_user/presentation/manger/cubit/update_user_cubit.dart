import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_user/data/models/user_model.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/manger/cubit/update_user_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());
  List<UserModel> listOfUsers = [];
  List<int> usersIdList = [];

  Future updateUser({
    required String userId,
    required String name,
    required String email,
    required String phone,
    required String password,
    required String userType,
    required String userStatus,
    required String depId,
  }) async {
    emit(UpdateUserLoading());
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.userUpdateEndpoint + userId,
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'user_type': userType,
          'user_status': userStatus,
          'department_id': depId,
        },
        token: token,
      );
      emit(UpdateUserSuccess());
    } on Exception catch (e) {
      emit(UpdateUserFailure(errmsg: e.toString()));
    }
  }

  getAllUsers() async {
    var alldepsdata = await Api()
        .get(url: EndPoints.baseUrl + EndPoints.allUsersEndpoint, token: token);
    for (var element in alldepsdata['data']) {
      listOfUsers.add(UserModel.fromJson(element));
    }
    for (var element in listOfUsers) {
      usersIdList.add(element.id!);
    }
  }
}
