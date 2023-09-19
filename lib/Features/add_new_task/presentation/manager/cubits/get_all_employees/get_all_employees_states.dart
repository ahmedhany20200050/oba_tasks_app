import 'package:tasks_app_eraasoft/core/data/models/user_model.dart';

abstract class GetAllEmployeesStates {}

class GetAllEmployeesInitialState extends GetAllEmployeesStates {}

class GetAllEmployeesLoadingState extends GetAllEmployeesStates {}

class GetAllEmployeesSuccessState extends GetAllEmployeesStates {
  final List<UserModel> employees;

  GetAllEmployeesSuccessState({required this.employees});
}

class GetAllEmployeesFailureState extends GetAllEmployeesStates {
  final String errorMessage;

  GetAllEmployeesFailureState({required this.errorMessage});
}
