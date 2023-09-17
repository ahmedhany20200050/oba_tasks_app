class UserModel {
  final int id;
  final String userCode;
  final String name;
  final String email;
  final String phone;
  final String status;
  final String userType;

  UserModel(
      {required this.id,
      required this.userCode,
      required this.name,
      required this.email,
      required this.phone,
      required this.status,
      required this.userType});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userCode: json['user_code'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      userType: json['user_type'],
    );
  }
}
