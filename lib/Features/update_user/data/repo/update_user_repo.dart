// class UpdateUserRepo {
//   static Future<void> updateUser(
//       {required String name,
//       required String email,
//       required String phone,
//       required String password,
//       required String userType}) async {
//     await Api.post(
//         url: EndPoints.baseUrl + EndPoints.addUserEndpoint,
//         body: {
//           'name': name,
//           'email': email,
//           'phone': phone,
//           'password': password,
//           'user_type': userType
//         },
//         token: token);
//   }
// }
