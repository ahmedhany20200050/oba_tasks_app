import 'package:tasks_app_eraasoft/Features/update_department/data/models/user_model.dart';

class DepartmentModel {
  final String id;
  final String name;
  final UserModel userModel;

  DepartmentModel(
      {required this.id, required this.name, required this.userModel});
  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      name: json['name'],
      userModel: UserModel.fromJson(json['manager']),
    );
  }
}
