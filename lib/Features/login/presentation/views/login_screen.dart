import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import '../../../../core/app_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const id = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return BlocBuilder<LoginCubitCubit, LoginCubitState>(
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
                            TextField(
                              controller: email,
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
                            TextField(
                              controller: password,
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
                                Checkbox(value: false, onChanged: (value) {}),
                                Text("Keep me logged in"),
                              ],
                            ),
                            SizedBox(
                              height: 48 * SizeConfig.verticalBlock,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF5A55CA),
                                ),
                                onPressed: () {
                                  logincbt.login(
                                    email: email.text,
                                    password: password.text,
                                  );
                                  // Navigator.of(context).pushNamed(routeName);
                                },
                                child: Text("Login",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
