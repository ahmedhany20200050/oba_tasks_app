class LoginUserModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  LoginUserModel({this.message, this.data, this.status, this.code});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
}

class Data {
  String? token;
  String? username;
  String? email;
  String? userType;

  Data({this.token, this.username, this.email, this.userType});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    email = json['email'];
    userType = json['user_type'];
  }
}
