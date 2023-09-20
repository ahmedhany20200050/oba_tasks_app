sealed class EmployeeViewStates {}

final class EmployeeViewInitial extends EmployeeViewStates {}

final class EmployeeGetAllTasks extends EmployeeViewStates {
  final int? code;

  EmployeeGetAllTasks({ this.code});
}

final class RadioSelectionChange extends EmployeeViewStates {}

final class EmployeeLogoutSuccess extends EmployeeViewStates {}

final class EmployeeLogoutLoading extends EmployeeViewStates {}

final class EmployeeLogoutFailure extends EmployeeViewStates {
  final String errmsg;

  EmployeeLogoutFailure({required this.errmsg});
}

final class EmployeeUpdateTaskSuccess extends EmployeeViewStates {}

final class EmployeeUpdateTaskLoading extends EmployeeViewStates {}

final class EmployeeUpdateTaskFailure extends EmployeeViewStates {
  final String errmsg;

  EmployeeUpdateTaskFailure({required this.errmsg});
}
