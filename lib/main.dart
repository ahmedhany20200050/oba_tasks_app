import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/add_department.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/update_department.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/presentation/views/add_tasks.dart';
import 'package:tasks_app_eraasoft/Features/users_page/presentation/views/users_screen.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => LoginCubitCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:  LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          UsersScreen.id: (context) => const UsersScreen(),
          AddDepartmentScreen.id:(context)=>const AddDepartmentScreen(),
          UpdateDepartmentScreen.id:(context)=>const UpdateDepartmentScreen(),
          AddTasksScreen.id:(context)=>const AddTasksScreen(),
        },

      ),
    );
  }
}
