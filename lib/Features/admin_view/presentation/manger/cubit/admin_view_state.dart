sealed class AdminViewStates {}

final class AdminViewInitial extends AdminViewStates {}

final class AdminGetAllTasks extends AdminViewStates {
  final int? code;

  AdminGetAllTasks({this.code});
}

final class AdminGetAllDeps extends AdminViewStates {
  final int? code;

  AdminGetAllDeps({this.code});
}

final class AdminLogoutSuccess extends AdminViewStates {}

final class AdminLogoutLoading extends AdminViewStates {}

final class AdminLogoutFailure extends AdminViewStates {
  final String errmsg;

  AdminLogoutFailure({required this.errmsg});
}

final class AdminDeleteTaskSuccess extends AdminViewStates {}

final class AdminDeleteTaskLoading extends AdminViewStates {}

final class AdminDeleteTaskFailure extends AdminViewStates {
  final String errmsg;

  AdminDeleteTaskFailure({required this.errmsg});
}

final class AdminDeleteUserSuccess extends AdminViewStates {}

final class AdminDeleteUserLoading extends AdminViewStates {}

final class AdminDeleteUserFailure extends AdminViewStates {
  final String errmsg;

  AdminDeleteUserFailure({required this.errmsg});
}
final class AdminDeleteDepSuccess extends AdminViewStates {}

final class AdminDeleteDepLoading extends AdminViewStates {}

final class AdminDeleteDepFailure extends AdminViewStates {
  final String errmsg;

  AdminDeleteDepFailure({required this.errmsg});
}
