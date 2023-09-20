class AdminDepModel {
  int? id;
  String? name;
  AdminManager? manager;
  List<AdminManager>? employees;

  AdminDepModel({this.id, this.name, this.manager, this.employees});

  AdminDepModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager =
        json['manager'] != null ? AdminManager.fromJson(json['manager']) : null;
    if (json['employees'] != null) {
      employees = <AdminManager>[];
      json['employees'].forEach((v) {
        employees!.add(AdminManager.fromJson(v));
      });
    }
  }
}

class AdminManager {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  AdminManager(
      {this.id,
      this.userCode,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.userType,
      this.departmentId});

  AdminManager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
    departmentId = json['department_id'];
  }
}
