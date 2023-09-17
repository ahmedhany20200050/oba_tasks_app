abstract class SelectDepartmentStates {}

class SelectDepartmentInitial extends SelectDepartmentStates {}

class SelectDepartmentSelect extends SelectDepartmentStates {
  final String departmentName;

  SelectDepartmentSelect({required this.departmentName});
}
