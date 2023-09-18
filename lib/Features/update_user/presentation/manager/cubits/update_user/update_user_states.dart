abstract class UpdateUserStates {}
class UpdateUserInitial extends UpdateUserStates {}
class UpdateUserLoading extends UpdateUserStates {}
class UpdateUserSuccess extends UpdateUserStates {}
class UpdateUserFailure extends UpdateUserStates {
  final String errorMessage;
  UpdateUserFailure({required this.errorMessage});
}
