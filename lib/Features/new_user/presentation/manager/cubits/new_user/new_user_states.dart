abstract class NewUserStates {}
class NewUserInitial extends NewUserStates {}
class NewUserLoading extends NewUserStates {}
class NewUserSuccess extends NewUserStates {}
class NewUserFailure extends NewUserStates {
  final String errorMessage;
  NewUserFailure({required this.errorMessage});
}