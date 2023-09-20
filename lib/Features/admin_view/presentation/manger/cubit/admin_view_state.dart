sealed class AdminViewStates {}

final class AdminViewInitial extends AdminViewStates {}

final class AdminGetAllTasks extends AdminViewStates {
  final int? code;

  AdminGetAllTasks({this.code});
}

final class AdminLogoutSuccess extends AdminViewStates {}

final class AdminLogoutLoading extends AdminViewStates {}

final class AdminLogoutFailure extends AdminViewStates {
  final String errmsg;

  AdminLogoutFailure({required this.errmsg});
}
