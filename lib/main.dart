import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/manager/cubits/calendar/calendar_cubit.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/manager/cubits/get_all_employees/get_all_employees_cubit.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/views/add_new_task_screen.dart';
import 'package:tasks_app_eraasoft/Features/admin_and_manager/presentation/views/admin_and_manager_screen.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/manager/cubits/add_department/add_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/views/screen/new_department_screen.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/manager/cubits/new_user/new_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/views/new_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/get_all_departments/get_all_departments_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/select_department/select_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/update_department/update_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/update_department_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/cubits/drop_down/drop_down_cubit.dart';
import 'package:tasks_app_eraasoft/core/cubits/radio_button/radio_button_cubit.dart';
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
        BlocProvider<GetAllDepartmentsCubit>(
          create: (context) => GetAllDepartmentsCubit(),
        ),
        BlocProvider<SelectDepartmentCubit>(
            create: (context) => SelectDepartmentCubit()),
        BlocProvider<RadioButtonCubit>(create: (context) => RadioButtonCubit()),
        BlocProvider<NewUserCubit>(create: (context) => NewUserCubit()),
        BlocProvider<CalendarCubit>(create: (context) => CalendarCubit()),
        BlocProvider<GetAllEmployeesCubit>(
            create: (context) => GetAllEmployeesCubit()),
        BlocProvider<DropDownCubit>(create: (context) => DropDownCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.color0xFFF3FAF9),
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          NewDepartmentScreen.id: (context) => const NewDepartmentScreen(),
          UpdateDepartmentScreen.id: (context) =>
              const UpdateDepartmentScreen(),
          NewUserScreen.id: (context) => const NewUserScreen(),
          AdminAndManagerScreen.id: (context) => const AdminAndManagerScreen(),
          AddNewTaskScreen.id: (context) => const AddNewTaskScreen(),
        },
      ),
    );
  }
}
