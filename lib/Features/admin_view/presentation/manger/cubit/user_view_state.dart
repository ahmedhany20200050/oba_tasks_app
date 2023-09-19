sealed class UserViewState {}

final class UserViewInitial extends UserViewState {}

final class ViewLogoutSuccess extends UserViewState {}

final class ViewLogoutLoading extends UserViewState {}

final class ViewLogoutFailure extends UserViewState {
  final String errmsg;

  ViewLogoutFailure({required this.errmsg});
}
