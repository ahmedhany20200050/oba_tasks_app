sealed class UserTasksState {}

final class UserTasksInitial extends UserTasksState {}

final class TasksLogoutSuccess extends UserTasksState {}

final class TasksLogoutLoading extends UserTasksState {}

final class TasksLogoutFailure extends UserTasksState {
  final String errmsg;

  TasksLogoutFailure({required this.errmsg});
}
