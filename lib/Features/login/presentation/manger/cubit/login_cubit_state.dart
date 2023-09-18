sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitSuccess extends LoginCubitState {
  final String email;
  final String userName;
  final String userType;

  LoginCubitSuccess({required this.email, required this.userName, required this.userType});
}

final class LoginCubitFailure extends LoginCubitState {
  final String errmsg;

  LoginCubitFailure({required this.errmsg});
}
