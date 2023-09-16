import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

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
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
        token: token,
      );
      // print('logged out');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
    // ignore: unused_catch_clause
    } on Exception catch (e) {
      // print(e.toString());
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
          ],
        ),
      ),
      body: Container(),
    );
  }
}
