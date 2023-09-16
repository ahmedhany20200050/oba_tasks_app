sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitSuccess extends LoginCubitState {}

final class LoginCubitFailure extends LoginCubitState {
  final String errmsg;

  LoginCubitFailure({required this.errmsg});
}
