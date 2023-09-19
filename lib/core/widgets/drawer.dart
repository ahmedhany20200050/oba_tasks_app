import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/presentation/views/add_tasks.dart';
import 'package:tasks_app_eraasoft/Features/users_page/presentation/views/users_screen.dart';

import '../../Features/departmentForms/presentation/views/add_department.dart';
import '../../Features/departmentForms/presentation/views/update_department.dart';
import '../../Features/home/presentation/views/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                logout(context);
              },
              child: const Text("Logout")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddDepartmentScreen.id);
              },
              child: const Text("Add Department")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UpdateDepartmentScreen.id);
              },
              child: const Text("Update Department")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UsersScreen.id);
              },
              child: const Text("UsersScreen")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddTasksScreen.id);
              },
              child: const Text("Add Tasks Screen")),
        ],
      ),
    );
  }
}