import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/add_department.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/update_department.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/presentation/views/add_tasks.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

import 'Features/admin_and_manager/presentation/views/admin_and_manager_screen.dart';
import 'Features/new_user/presentation/manager/cubits/new_user/new_user_cubit.dart';
import 'Features/new_user/presentation/views/new_user_screen.dart';
import 'core/cubits/drop_down/drop_down_cubit.dart';
import 'core/cubits/radio_button/radio_button_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubitCubit>(
          create: (context) => LoginCubitCubit(),
        ),
        BlocProvider<RadioButtonCubit>(create: (context) => RadioButtonCubit()),
        BlocProvider<NewUserCubit>(create: (context) => NewUserCubit()),
        BlocProvider<DropDownCubit>(create: (context) => DropDownCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          AddDepartmentScreen.id: (context) => const AddDepartmentScreen(),
          UpdateDepartmentScreen.id: (
              context) => const UpdateDepartmentScreen(),
          AddTasksScreen.id: (context) => const AddTasksScreen(),
          AdminAndManagerScreen.id: (context) => const AdminAndManagerScreen(),
          NewUserScreen.id: (context) => const NewUserScreen(),
        },

      ),
    );
  }
}
