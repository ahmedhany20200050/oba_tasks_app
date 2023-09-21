import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/data/models/admin_dep_model.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_state.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/manger/cubit/update_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/manger/cubit/update_user_state.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});
  static const id = 'UpdateUserScreen';

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? name;
  String? email;
  String? phone;
  String? password;
  int radioSelection = 0;
  int? selectedDepId;

  @override
  Widget build(BuildContext context) {
    AdminManager user =
        ModalRoute.of(context)!.settings.arguments as AdminManager;
    return BlocBuilder<AdminViewCubit, AdminViewStates>(
      builder: (context, state) {
        return BlocConsumer<UpdateUserCubit, UpdateUserState>(
          listener: (context, state) {
            if (state is UpdateUserSuccess) {
              BlocProvider.of<AdminViewCubit>(context).adminAllDeparts();
              customSnakbar(
                context,
                const SnackBar(
                  content: Text('User updated successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            }
            if (state is UpdateUserFailure) {
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
            var updateUSerCbt = BlocProvider.of<UpdateUserCubit>(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
              ),
              body: state is UpdateUserLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24 * SizeConfig.horizontalBlock,
                          vertical: 48 * SizeConfig.verticalBlock),
                      child: Form(
                        key: formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Update User Details!',
                                textAlign: TextAlign.center,
                                style: AppStyles.LoginTextStyle1,
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              SizedBox(
                                width: 274 * SizeConfig.horizontalBlock,
                                child: Text(
                                  'Update user details and give them a new identity.',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.LogintextStyle2,
                                ),
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
                                initialValue: user.name,
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
                                onChanged: (value) {
                                  name = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value!.length < 3 || value.length > 20) {
                                    return 'Name must be between 3-20 characters';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
                                initialValue: user.email,
                                keyboardType: TextInputType.emailAddress,
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
                                onChanged: (value) {
                                  email = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (!value!.contains("@") &&
                                      !value.contains('.com')) {
                                    return 'Enter valid email like (value@value.com)';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
                                initialValue: user.phone.toString(),
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
                                onChanged: (value) {
                                  phone = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value!.length > 11) {
                                    return 'Phone must not be more than 11 numbers';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              TextFormField(
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
                                onChanged: (value) {
                                  password = value;
                                },
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
                              const Row(
                                children: [
                                  Text(
                                    'Choose department ID',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10 * SizeConfig.verticalBlock,
                              ),
                              DropdownSearch<int>(
                                selectedItem: user.departmentId,
                                items: updateUSerCbt.depsIdList,
                                onChanged: (value) {
                                  selectedDepId = value;
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
                                        BlocProvider.of<UpdateUserCubit>(
                                                context)
                                            .updateUser(
                                          userId: user.id!.toString(),
                                          name: name ?? user.name!,
                                          email: email ?? user.email!,
                                          phone:
                                              phone ?? user.phone!.toString(),
                                          password: password!,
                                          userType: radioSelection.toString(),
                                          userStatus: '0',
                                          depId:
                                              selectedDepId.toString() == 'null'
                                                  ? user.departmentId.toString()
                                                  : selectedDepId.toString(),
                                        );
                                      }
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF5A55CA),
                                      ),
                                    ),
                                    child: Text(
                                      'UPDATE',
                                      style: AppStyles.textStyle14,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
