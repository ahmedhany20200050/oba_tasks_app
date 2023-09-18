import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/admin_and_manager/presentation/views/admin_and_manager_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/views/screen/new_department_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import 'package:tasks_app_eraasoft/core/utils/snack_bar_viewer.dart';
import '../../../../core/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SnackBarViewer {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var logincbt = BlocProvider.of<LoginCubitCubit>(context);
    return Scaffold(
        body: BlocListener<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitSuccess) {
          showSnackBar(
              context: context,
              message: "Login Successfully",
              backgroundColor: Colors.green);
          Navigator.of(context).pushNamed(
            state.userType == "admin"
                ? AdminAndManagerScreen.id
                : NewDepartmentScreen.id,
          );
        } else if (state is LoginCubitFailure) {
          showSnackBar(
              context: context,
              message: state.errmsg,
              backgroundColor: Colors.red);
        } else {
          showDialog(
              context: context,
              builder: (_) => const Dialog(
                    child: Center(child: Text("Loading...")),
                  ));
        }
      },
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 24 * SizeConfig.horizontalBlock,
              vertical: 55 * SizeConfig.verticalBlock),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome Back!",
                    textAlign: TextAlign.center,
                    style: AppStyles.loginTextStyle1,
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
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty.';
                      } else if (!value.contains('@')) {
                        return 'Email must contain @ .';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: AppColors.color0xFF091E4A,
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
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.length < 8 || value.isEmpty) {
                        return 'Password must be more than or equal 8 characters.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: AppColors.color0xFF091E4A,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text("Keep me logged in"),
                    ],
                  ),
                  SizedBox(
                    height: 48 * SizeConfig.verticalBlock,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF5A55CA),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          logincbt.login(
                            email: _emailController.text,
                            password: _passwordController.text,
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
      ),
    ));
  }
}
