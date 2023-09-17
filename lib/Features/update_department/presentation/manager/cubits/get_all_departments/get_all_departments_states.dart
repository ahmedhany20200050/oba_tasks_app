import 'package:tasks_app_eraasoft/Features/update_department/data/models/department_model.dart';

abstract class GetAllDepartmentsStates {}

class GetAllDepartmentsInitial extends GetAllDepartmentsStates {}

class GetAllDepartmentsLoading extends GetAllDepartmentsStates {}

class GetAllDepartmentsSuccess extends GetAllDepartmentsStates {
  final List<DepartmentModel> departments;

  GetAllDepartmentsSuccess({required this.departments});
}
class GetAllDepartmentsFailure extends GetAllDepartmentsStates {
  final String errorMessage;

  GetAllDepartmentsFailure({required this.errorMessage});
}
