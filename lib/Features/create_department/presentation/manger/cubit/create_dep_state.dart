sealed class CreateDepState {}

final class CreateDepInitial extends CreateDepState {}

final class CreateDepSuccess extends CreateDepState {}

final class CreateDepLoading extends CreateDepState {}

final class CreateDepFailure extends CreateDepState {
  final String errmsg;

  CreateDepFailure({required this.errmsg});
}
