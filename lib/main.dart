import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/manger/cubit/create_dep_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/views/widgets/create_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/manger/cubit/create_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/views/widgets/create_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manger/cubit/update_dep_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/widgets/update_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/manger/cubit/update_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/views/widgets/update_user_screen.dart';
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
        BlocProvider(
          create: (context) => LoginCubitCubit(),
        ),
        BlocProvider(
          create: (context) => CreateDepCubit(),
        ),
        BlocProvider(
          create: (context) => CreateUserCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateDepCubit()..getAllDepartments(),
        ),
        BlocProvider(
          create: (context) => UpdateUserCubit()..getAllUsers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          CreateDepScreen.id: (context) => const CreateDepScreen(),
          CreateUSerScreen.id: (context) => const CreateUSerScreen(),
          UpdateDepScreen.id: (context) => const UpdateDepScreen(),
          UpdateUserScreen.id: (context) => const UpdateUserScreen(),
        },
      ),
    );
  }
}
