import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/select_department/select_department_states.dart';

class SelectDepartmentCubit extends Cubit<SelectDepartmentStates> {
  SelectDepartmentCubit() : super(SelectDepartmentInitial());

  static SelectDepartmentCubit get(context) => BlocProvider.of(context);
  void selectDepartment(String departmentName) {
    emit(SelectDepartmentSelect(departmentName: departmentName));
  }
}
