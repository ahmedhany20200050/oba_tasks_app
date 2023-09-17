import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/update_department/update_department_states.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentStates> {
  UpdateDepartmentCubit() : super(UpdateDepartmentInitial());

  static UpdateDepartmentCubit get(context) => BlocProvider.of(context);

  void updateDepartment(
      {required String departmentName, required String managerId, required departmentId}) async {
    try {
      emit(UpdateDepartmentLoading());
      var data = await Api.post(
          url: "${EndPoints.baseUrl}${EndPoints.updateDepartmentEndPoint}/$departmentId",
          body: {'name': departmentName, 'manager_id': managerId},
          token: token);
      emit(UpdateDepartmentSuccess(successMessage: data['message']));
    } on Exception catch (e) {
      emit(UpdateDepartmentFailure(errorMessage: e.toString()));
    } catch (_) {
      emit(UpdateDepartmentFailure(errorMessage: "Something Went Wrong"));
    }
  }
}
