
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/update_department/data/repo/get_all_departments_repo.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/get_all_departments/get_all_departments_states.dart';

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
