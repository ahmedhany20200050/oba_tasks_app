import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/manager/cubits/add_department/add_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/views/screen/new_department_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/update_department/update_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/update_department_screen.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

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
        BlocProvider<AddDepartmentCubit>(
          create: (context) => AddDepartmentCubit(),
        ),
        BlocProvider<UpdateDepartmentCubit>(
            create: (context) => UpdateDepartmentCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          NewDepartmentScreen.id: (context) => const NewDepartmentScreen(),
          // UpdateDepartmentScreen.id:(context) => const UpdateDepartmentScreen()
        },
      ),
    );
  }
}
