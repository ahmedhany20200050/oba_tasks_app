// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import '../../../../core/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitSuccess) {
          Navigator.of(context).pushNamed(HomeScreen.id);
        }
      },
      builder: (context, state) {
        var logincbt = BlocProvider.of<LoginCubitCubit>(context);
        return Scaffold(
            body: state is LoginCubitLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is LoginCubitFailure
                    ? Center(
                        child: Text(state.errmsg),
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
                                  SizedBox(
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
                                  SizedBox(
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
                                        borderSide: BorderSide(
                                          color: AppColors.textFieldColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
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
                                        borderSide: BorderSide(
                                          color: AppColors.textFieldColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: false, onChanged: (value) {}),
                                      Text("Keep me logged in"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 48 * SizeConfig.verticalBlock,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xFF5A55CA),
                                      ),
                                      onPressed: () async {
                                        if (formkey.currentState!.validate()) {
                                          await logincbt.login(
                                            email: email.text,
                                            password: password.text,
                                          );
                                        }
                                      },
                                      child: Text("Login",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
      },
    );
  }
}
