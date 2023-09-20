// ignore_for_file: body_might_complete_normally_nullable, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_state.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/views/widgets/create_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_task/presentation/views/create_task_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/views/widgets/create_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/widgets/update_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/views/widgets/update_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/views/employee_view_screen.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/admin_view_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import '../../../../core/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool chechbox = false;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminViewCubit,AdminViewStates>(
      builder:(context, state) =>  BlocConsumer<LoginCubitCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is LoginCubitSuccess) {
            if (state.usertype.contains('employ')) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                EmployeeViewScreen.id,
                (route) => false,
              );
            } else {
              BlocProvider.of<AdminViewCubit>(context).adminAllTasks();
              BlocProvider.of<AdminViewCubit>(context).adminAllDeparts();
              Navigator.of(context).pushNamedAndRemoveUntil(
                AdminViewScreen.id,
                (route) => false,
              );
              
            }
            customSnakbar(
              context,
              const SnackBar(
                content: Text('Loggedin successfully'),
                backgroundColor: Colors.green,
              ),
            );
          }
    
          if (state is LoginCubitFailure) {
            customSnakbar(
              context,
              SnackBar(
                content: Text(state.errmsg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          var logincbt = BlocProvider.of<LoginCubitCubit>(context);
          return Scaffold(
              body: state is LoginCubitLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24 * SizeConfig.horizontalBlock,
                            vertical: 55 * SizeConfig.verticalBlock),
                        child: Form(
                          key: formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Welcome Back!",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.LoginTextStyle1,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Login to access your assigned tasks and personal overview.",
                                        style: AppStyles.LogintextStyle2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  controller: email,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email must not be empty.';
                                    } else if (!value.contains('@')) {
                                      return 'Email must contain @ .';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.textFieldColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller: password,
                                  validator: (value) {
                                    if (value!.length < 8 || value.isEmpty) {
                                      return 'Password must be more than or equal 8 characters.';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.textFieldColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: chechbox,
                                        onChanged: (value) {
                                          setState(() {
                                            if (chechbox) {
                                              chechbox = false;
                                            } else {
                                              chechbox = true;
                                            }
                                          });
                                          SecureStorage.writeData(
                                            key: 'keepme',
                                            value: chechbox.toString(),
                                          );
                                        }),
                                    const Text("Keep me logged in"),
                                  ],
                                ),
                                SizedBox(
                                  height: 48 * SizeConfig.verticalBlock,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFF5A55CA),
                                    ),
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        await logincbt.login(
                                          email: email.text,
                                          password: password.text,
                                        );
                                      }
                                    },
                                    child: const Text("Login",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
        },
      ),
    );
  }
}
