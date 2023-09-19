import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/manger/cubit/create_dep_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class CreateDepCubit extends Cubit<CreateDepState> {
  CreateDepCubit() : super(CreateDepInitial());
  String? token;

  Future createDepartment({required String name}) async {
    emit(CreateDepLoading());
    token = await SecureStorage.getData(key: 'token');
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.depStoreEndpoint,
        body: {
          'name': name,
        },
        token: token,
      );
      emit(CreateDepSuccess());
    } on Exception catch (e) {
      emit(CreateDepFailure(errmsg: e.toString()));
    }
  }
}
