import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/data/repo/get_all_employees_repo.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/manager/cubits/get_all_employees/get_all_employees_states.dart';

class GetAllEmployeesCubit extends Cubit<GetAllEmployeesStates> {
  GetAllEmployeesCubit() : super(GetAllEmployeesInitialState());

  static GetAllEmployeesCubit get(context) => BlocProvider.of(context);

  void getAllEmployees() async {
    try {
      emit(GetAllEmployeesLoadingState());
      final employees = await GetAllEmployeesRepo.getAllEmployees();
      emit(GetAllEmployeesSuccessState(employees: employees));
    } on Exception catch (e) {
      emit(GetAllEmployeesFailureState(errorMessage: e.toString()));
    } catch (_) {
      emit(GetAllEmployeesFailureState(errorMessage: "Something went wrong"));
    }
  }
}
