abstract class TasksScreensState {
  String? errmsg;
}

final class TasksScreensInitial extends TasksScreensState {}


//add tasks states
final class AddTasksScreensSuccess extends TasksScreensState {}
final class AddTasksScreensLoading extends TasksScreensState {}
final class AddTasksScreensFailed extends TasksScreensState {
  @override
  String? errmsg;
  AddTasksScreensFailed({required this.errmsg});
}

//Update tasks states
final class UpdateTasksScreensSuccess extends TasksScreensState {}
final class UpdateTasksScreensLoading extends TasksScreensState {}
 class UpdateTasksScreensFailed extends TasksScreensState {
   @override
   String? errmsg;
  UpdateTasksScreensFailed(this.errmsg);
}

//Get Employess

final class GetEmpSuccess extends TasksScreensState {}
final class GetEmpLoading extends TasksScreensState {}
final class GetEmpFailed extends TasksScreensState {
  @override
  String? errmsg;

  GetEmpFailed({required this.errmsg});
}


