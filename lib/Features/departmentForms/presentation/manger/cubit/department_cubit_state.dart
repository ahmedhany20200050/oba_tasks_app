sealed class DepartmentCubitState {}

final class DepartmentCubitInitial extends DepartmentCubitState {}

final class AddDepartmentCubitLoading extends DepartmentCubitState {}

final class AddDepartmentCubitSuccess extends DepartmentCubitState {}

final class AddDepartmentCubitFailure extends DepartmentCubitState {
  final String errmsg;

  AddDepartmentCubitFailure({required this.errmsg});
}

//update dept classes


final class UpdateDepartmentCubitLoading extends DepartmentCubitState {}

final class UpdateDepartmentCubitSuccess extends DepartmentCubitState {}

final class UpdateDepartmentCubitFailure extends DepartmentCubitState {
  final String errmsg;

  UpdateDepartmentCubitFailure({required this.errmsg});
}
//get departments classes
final class GetDepartmentCubitLoading extends DepartmentCubitState {}

final class GetDepartmentCubitSuccess extends DepartmentCubitState {}

final class GetDepartmentCubitFailure extends DepartmentCubitState {
  final String errmsg;

  GetDepartmentCubitFailure({required this.errmsg});
}
