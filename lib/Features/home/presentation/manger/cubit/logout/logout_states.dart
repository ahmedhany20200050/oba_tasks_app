abstract class LogoutStates {}

class LogoutInitialState extends LogoutStates {}
class LogoutLoadingState extends LogoutStates {}
class LogoutSuccessState extends LogoutStates {
  final String successMessage;
  LogoutSuccessState({required this.successMessage});
}
class LogoutFailureState extends LogoutStates {
  final String errorMessage;
  LogoutFailureState({required this.errorMessage});
}
