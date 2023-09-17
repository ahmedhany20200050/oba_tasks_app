import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/manager/cubits/add_department/add_department_states.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class AddDepartmentCubit extends Cubit<AddDepartmentStates> {
  AddDepartmentCubit() : super(AddDepartmentInitial());

  static AddDepartmentCubit get(context) => BlocProvider.of(context);

  Future addDepartment({required String departmentName}) async {
    try {
      emit(AddDepartmentLoading());
      var data = await Api.post(
        url: EndPoints.baseUrl + EndPoints.addDepartmentEndpoint,
        body: {
          'name': departmentName,
        },
        token: token
      );
      emit(AddDepartmentSuccess(successMessage: data['message']));
    } on Exception catch (e) {
      emit(AddDepartmentFailure(errorMessage: e.toString()));
    }
  }
}
