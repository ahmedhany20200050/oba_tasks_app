import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/manger/cubit/create_dep_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/views/widgets/create_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_task/presentation/manger/cubit/create_task_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_task/presentation/views/create_task_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/manger/cubit/create_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/views/widgets/create_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manger/cubit/update_dep_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/widgets/update_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/manger/cubit/update_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/views/widgets/update_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/user_tasks/presentation/manger/cubit/user_tasks_cubit.dart';
import 'package:tasks_app_eraasoft/Features/user_tasks/presentation/views/user_tasks_screen.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/manger/cubit/user_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/views/user_view_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/helpers/cache_helper.dart';
import 'package:tasks_app_eraasoft/core/helpers/observer.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String firstPage;
  Bloc.observer = Observer();
  await CacheHelper.init();
  SecureStorage.init();
  String? userType = await SecureStorage.getData(key: 'userType');
  String? token = await SecureStorage.getData(key: "token");

  if (token == null || userType == null) {
    firstPage = LoginScreen.id;
  } else if (userType.contains('employ')) {
    firstPage = UserTasksScreen.id;
  } else {
    firstPage = UserViewScreen.id;
  }
  runApp(MyApp(firstPage: firstPage));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.firstPage}) : super(key: key);
  final String firstPage;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubitCubit(),
        ),
        BlocProvider(
          create: (context) => UserViewCubit(),
        ),
        BlocProvider(
          create: (context) => UserTasksCubit(),
        ),
        BlocProvider(
          create: (context) => CreateDepCubit(),
        ),
        BlocProvider(
          create: (context) => CreateUserCubit(),
        ),
        BlocProvider(
          create: (context) => CreateTaskCubit()..getAllEmployees(),
        ),
        BlocProvider(
          create: (context) => UpdateDepCubit()..getAllDepartments(),
        ),
        BlocProvider(
          create: (context) => UpdateUserCubit()..getAllUsers(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryswatch,
        )),
        debugShowCheckedModeBanner: false,
        initialRoute: firstPage,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          CreateDepScreen.id: (context) => const CreateDepScreen(),
          CreateUSerScreen.id: (context) => const CreateUSerScreen(),
          UpdateDepScreen.id: (context) => const UpdateDepScreen(),
          UpdateUserScreen.id: (context) => const UpdateUserScreen(),
          UserTasksScreen.id: (context) => const UserTasksScreen(),
          UserViewScreen.id: (context) => const UserViewScreen(),
          CreateTaskScreen.id: (context) => const CreateTaskScreen(),
        },
      ),
    );
  }
}
