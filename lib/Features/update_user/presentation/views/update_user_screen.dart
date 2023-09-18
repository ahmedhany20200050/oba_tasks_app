import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/manager/cubits/new_user/new_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/manager/cubits/new_user/new_user_states.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/views/widgets/custom_radio_button.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import 'package:tasks_app_eraasoft/core/utils/snack_bar_viewer.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_button.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_text_form_field.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({super.key});
  static const id = 'UpdateUserScreen';

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> with SnackBarViewer {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  final TextEditingController _departmentIdController = TextEditingController();
  final TextEditingController _radioButtonController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordContoller.dispose();
    _radioButtonController.dispose();
    _departmentIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewUserCubit, NewUserStates>(
        listener: (_, state) {
          if (state is NewUserSuccess) {
            Navigator.of(context).pop();
            showSnackBar(
                context: context,
                message: "Added User Sucessfully",
                backgroundColor: Colors.green);
          } else if (state is NewUserFailure) {
            Navigator.of(context).pop();
            showSnackBar(
                context: context,
                message: state.errorMessage,
                backgroundColor: Colors.red);
          } else {
            showDialog(
                context: context,
                builder: (_) => const Dialog(
                      child: Center(child: Text("Loading...")),
                    ));
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 24 * SizeConfig.horizontalBlock,
              vertical: 48 * SizeConfig.verticalBlock),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Add New User!",
                        style: AppStyles.loginTextStyle1,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20 * SizeConfig.verticalBlock,
                            left: 38 * SizeConfig.horizontalBlock,
                            right: 38 * SizeConfig.horizontalBlock),
                        child: Text(
                            "Create a new user now and assign them tasks right away.",
                            textAlign: TextAlign.center,
                            style: AppStyles
                                .color0xFF091E4AFontSize16FontWeightW400Height09AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: _nameController,
                    validator: (name) {
                      int length = name!.length;
                      if (length < 3 || length > 20) {
                        return "The name length must be between 3 and 20 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    hintText: "Email",
                    controller: _emailController,
                    validator: (email) {
                      if (!email!.contains("@")) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    hintText: "Phone",
                    controller: _phoneController,
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: "Password",
                    controller: _passwordContoller,
                    validator: (password) {
                      if (password!.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  // CustomTextFormField(
                  //   hintText: "Department Name",
                  //   controller: _departmentNameController,
                  // ),
                  // SizedBox(
                  //   height: 20 * SizeConfig.verticalBlock,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioButton(
                        radioButtonText: "Admin",
                        value: 0,
                        controller: _radioButtonController,
                      ),
                      CustomRadioButton(
                        radioButtonText: "Manager",
                        value: 1,
                        controller: _radioButtonController,
                      ),
                      CustomRadioButton(
                        radioButtonText: "User",
                        value: 2,
                        controller: _radioButtonController,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomButton(
                      textButton: "CREATE",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          NewUserCubit.get(context).addUser(
                              name: _nameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              password: _passwordContoller.text,
                              userType: _radioButtonController.text);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
