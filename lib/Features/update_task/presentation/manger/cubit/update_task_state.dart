sealed class UpdateTaskState {}

final class UpdateTaskInitial extends UpdateTaskState {}

final class GetValueSuccessfullyState extends UpdateTaskState {}

final class RadioSelectionChange extends UpdateTaskState {}

final class UpdateTaskLoading extends UpdateTaskState {}

final class UpdateTaskSuccess extends UpdateTaskState {}

final class UpdateTaskFailure extends UpdateTaskState {
  final String errmsg;

  UpdateTaskFailure({required this.errmsg});
}
