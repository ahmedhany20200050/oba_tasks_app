import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/manger/cubit/create_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/manger/cubit/create_user_state.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/views/widgets/update_user_screen.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CreateUSerScreen extends StatefulWidget {
  const CreateUSerScreen({super.key});
  static const id = 'CreateUSerScreen';

  @override
  State<CreateUSerScreen> createState() => _CreateUSerScreenState();
}

class _CreateUSerScreenState extends State<CreateUSerScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController namecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController phonecon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  int radioSelection = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubitCubit, LoginCubitState>(
      builder: (context, state) =>
          BlocConsumer<CreateUserCubit, CreateUserState>(
        listener: (context, state) {
          if (state is CreateUserSuccess) {
            Navigator.of(context).pushNamed(UpdateUserScreen.id);
            customSnakbar(
              context,
              const SnackBar(
                content: Text('User created successfully'),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state is CreateUserFailure) {
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
          return Scaffold(
            body: state is CreateUserLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24 * SizeConfig.horizontalBlock,
                          vertical: 48 * SizeConfig.verticalBlock),
                      child: Form(
                        key: formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Add New User!',
                                textAlign: TextAlign.center,
                                style: AppStyles.LoginTextStyle1,
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              SizedBox(
                                width: 274 * SizeConfig.horizontalBlock,
                                child: Text(
                                  'Create a new user now and assign them tasks right away.',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.LogintextStyle2,
                                ),
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
                                controller: namecon,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name must not be empty';
                                  } else if (value.length < 3 ||
                                      value.length > 20) {
                                    return 'Name must be between 3-20 characters';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
                                controller: emailcon,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email must not be empty';
                                  } else if (!value.contains("@") &&
                                      !value.contains('.com')) {
                                    return 'Enter valid email like (value@value.com)';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
                                controller: phonecon,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintText: 'Phone',
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Phone must not be empty';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
                                controller: passwordcon,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password must not be empty';
                                  } else if (value.length < 6) {
                                    return 'Password must be more than 6 characters';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25 * SizeConfig.verticalBlock,
                                    padding: EdgeInsets.only(
                                        right: 20 * SizeConfig.horizontalBlock),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: 0,
                                            groupValue: radioSelection,
                                            onChanged: (value) {
                                              setState(() {
                                                radioSelection = value!;
                                              });
                                            }),
                                        const Text('Admin')
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25 * SizeConfig.verticalBlock,
                                    padding: EdgeInsets.only(
                                        right: 20 * SizeConfig.horizontalBlock),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: radioSelection,
                                            onChanged: (value) {
                                              setState(() {
                                                radioSelection = value!;
                                              });
                                            }),
                                        const Text('Manager')
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25 * SizeConfig.verticalBlock,
                                    padding: EdgeInsets.only(
                                        right: 20 * SizeConfig.horizontalBlock),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: 2,
                                            groupValue: radioSelection,
                                            onChanged: (value) {
                                              setState(() {
                                                radioSelection = value!;
                                              });
                                            }),
                                        const Text('User')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              SizedBox(
                                width: 312 * SizeConfig.horizontalBlock,
                                height: 48 * SizeConfig.verticalBlock,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        if (!BlocProvider.of<LoginCubitCubit>(
                                                context)
                                            .model!
                                            .data!
                                            .userType!
                                            .contains('empl')) {
                                          BlocProvider.of<CreateUserCubit>(
                                                  context)
                                              .createUser(
                                            name: namecon.text,
                                            email: emailcon.text,
                                            phone: phonecon.text,
                                            password: passwordcon.text,
                                            userType: radioSelection.toString(),
                                            depId: '80',
                                          );
                                        }
                                      }
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF5A55CA),
                                      ),
                                    ),
                                    child: Text(
                                      'CREATE',
                                      style: AppStyles.textStyle14,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
