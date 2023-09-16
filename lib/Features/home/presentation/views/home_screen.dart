import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  logout();
                  Navigator.of(context).pushNamed(LoginScreen.id);
                },
                child: Text("Logout")),
          ],
        ),
      ),
      body: Container(),
    );
  }

  logout() async {
    try {
      // ignore: missing_required_param
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
      );
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
