import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/manger/cubit/create_dep_state.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class CreateDepCubit extends Cubit<CreateDepState> {
  CreateDepCubit() : super(CreateDepInitial());

  Future createDepartment({required String name}) async {
    emit(CreateDepLoading());
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.depStoreEndpoint,
        body: {
          'name': name,
        },
        token: token,
      );
      emit(CreateDepSuccess());
      print("Created");
    } on Exception catch (e) {
      emit(CreateDepFailure(errmsg: e.toString()));
    }
  }
}
