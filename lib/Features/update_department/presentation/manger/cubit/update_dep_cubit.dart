import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/update_department/data/models/dep_model.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manger/cubit/update_dep_state.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class UpdateDepCubit extends Cubit<UpdateDepState> {
  UpdateDepCubit() : super(UpdateDepInitial());
  List<DepModel> listOfDeps = [];
  List<int> depsIdList = [];

  Future updateDepartment({
    required String depId,
    required String depName,
    required String managerId,
  }) async {
    emit(UpdateDepLoading());
    await SecureStorage.getData(key: 'token');
    try {
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.depUpdateEndpoint + depId,
        body: {
          'name': depName,
          'manager_id': managerId,
        },
        token: SecureStorage.value,
      );
      emit(UpdateDepSuccess());
    } on Exception catch (e) {
      emit(UpdateDepFailure(errmsg: e.toString()));
    }
  }

  getAllDepartments() async {
    await SecureStorage.getData(key: 'token');
    var alldepsdata = await Api().get(
      url: EndPoints.baseUrl + EndPoints.allDepsEndpoint,
      token: SecureStorage.value,
    );
    for (var element in alldepsdata['data']) {
      listOfDeps.add(DepModel.fromJson(element));
    }
    for (var element in listOfDeps) {
      depsIdList.add(element.id!);
    }
  }
}
