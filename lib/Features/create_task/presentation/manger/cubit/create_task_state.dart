sealed class CreateTaskState {}

final class CreateTaskInitial extends CreateTaskState {}

final class CreateTaskSuccess extends CreateTaskState {}

final class CreateTaskLoading extends CreateTaskState {}
final class GetValueSuccessfullyState extends CreateTaskState {}

final class CreateTaskFailure extends CreateTaskState {
  final String errmsg;

  CreateTaskFailure({required this.errmsg});
}
