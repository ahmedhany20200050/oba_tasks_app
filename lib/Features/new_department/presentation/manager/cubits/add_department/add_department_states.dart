abstract class AddDepartmentStates {}

class AddDepartmentInitial extends AddDepartmentStates {}

class AddDepartmentLoading extends AddDepartmentStates {}

class AddDepartmentSuccess extends AddDepartmentStates {
  final String successMessage;

  AddDepartmentSuccess({required this.successMessage});
}

class AddDepartmentFailure extends AddDepartmentStates {
  final String errorMessage;
  AddDepartmentFailure({required this.errorMessage});
}
