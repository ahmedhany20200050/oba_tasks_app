class DepModel {
  int? id;
  String? name;
  Manager? manager;

  DepModel({this.id, this.name, this.manager});

  DepModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager =
        json['manager'] != null ?  Manager.fromJson(json['manager']) : null;
  }
}

class Manager {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;

  Manager(
      {this.id,
      this.userCode,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.userType});

  Manager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
  }
}
