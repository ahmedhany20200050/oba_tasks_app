import 'package:tasks_app_eraasoft/core/data/models/user_model.dart';

class DepartmentModel {
  final int id;
  final String name;
  final UserModel? userModel;

  DepartmentModel(
      {required this.id, required this.name, required this.userModel});
  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      name: json['name'],
      userModel: json['manager']!=null?UserModel.fromJson(json['manager']):null,
    );
  }
}
