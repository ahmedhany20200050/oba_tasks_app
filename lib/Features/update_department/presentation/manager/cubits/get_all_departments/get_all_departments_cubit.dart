import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/data/models/department_model.dart';
import 'package:tasks_app_eraasoft/Features/update_department/data/repo/get_all_departments_repo.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/get_all_departments/get_all_departments_states.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

class GetAllDepartmentsCubit extends Cubit<GetAllDepartmentsStates> {
  GetAllDepartmentsCubit() : super(GetAllDepartmentsInitial());

  static GetAllDepartmentsCubit get(context) => BlocProvider.of(context);

  void getAllDepartments() async {
    try {
      emit(GetAllDepartmentsLoading());
      final departments = await GetAllDepartmentsRepo.getAllDepartments();
      
      
      emit(GetAllDepartmentsSuccess(departments: departments));
    } on Exception catch (e) {
      emit(GetAllDepartmentsFailure(errorMessage: e.toString()));
    } catch (_) {
      emit(GetAllDepartmentsFailure(errorMessage: "Something Went Wrong"));
    }
  }
}
