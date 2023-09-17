abstract class UpdateDepartmentStates {}

class UpdateDepartmentInitial extends UpdateDepartmentStates {}

class UpdateDepartmentLoading extends UpdateDepartmentStates {}

class UpdateDepartmentSuccess extends UpdateDepartmentStates {
  final String successMessage;

  UpdateDepartmentSuccess({required this.successMessage});
}

class UpdateDepartmentFailure extends UpdateDepartmentStates {
  final String errorMessage;

  UpdateDepartmentFailure({required this.errorMessage});
}
