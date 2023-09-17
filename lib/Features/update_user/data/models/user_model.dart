class UserModel {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;

  UserModel(
      {this.id,
      this.userCode,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.userType});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
  }
}
