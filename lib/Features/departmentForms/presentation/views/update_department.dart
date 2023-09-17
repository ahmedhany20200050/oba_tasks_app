// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import '../../../../core/app_styles.dart';

class UpdateDepartmentScreen extends StatefulWidget {
  const UpdateDepartmentScreen({super.key});
  static const id = 'UpdateDepartmentScreen';

  @override
  State<UpdateDepartmentScreen> createState() => _UpdateDepartmentScreenState();
}

class _UpdateDepartmentScreenState extends State<UpdateDepartmentScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController assignedManager = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                      "Update Department!",
                      textAlign: TextAlign.center,
                      style: AppStyles.titleStyle,
                      maxLines: 1,
                    ),
                    const   SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Update  department details and assign a new manager to continue work!",
                            style: AppStyles.descriptionStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const  SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'name must not be empty.';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:const BorderSide(
                            color: AppColors.textFieldColor,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const     SizedBox(
                      height: 24,
                    ),

                    SizedBox(
                      height: 48 * SizeConfig.verticalBlock,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:const Color(0xFF5A55CA),
                        ),
                        onPressed: () async {

                        },
                        child: Text("Update",
                            textAlign: TextAlign.center,
                            style:
                            AppStyles.buttonTextStyle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
