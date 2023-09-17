sealed class UpdateDepState {}

final class UpdateDepInitial extends UpdateDepState {}

final class UpdateDepLoading extends UpdateDepState {}

final class UpdateDepSuccess extends UpdateDepState {}

final class UpdateDepFailure extends UpdateDepState {
  final String errmsg;

  UpdateDepFailure({required this.errmsg});
}
