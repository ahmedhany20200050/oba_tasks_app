import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/update_department.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

import '../../../departmentForms/presentation/views/add_department.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future logout(context) async {
    try {
      // ignore: missing_required_param
      var storage =FlutterSecureStorage();
      var storage2=await SharedPreferences.getInstance();
      await storage2.setBool("keepMeLoggedIn", false);
      String? token = await storage.read(key: "token");
      await storage.delete(key: "token");
      // print('logged out');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.id,(route) => false,);
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
        token: token,
      );

    // ignore: unused_catch_clause
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  logout(context);
                },
                child:const Text("Logout")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddDepartmentScreen.id);
                },
                child:const Text("Add Department")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(UpdateDepartmentScreen.id);
                },
                child:const Text("Update Department")),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
