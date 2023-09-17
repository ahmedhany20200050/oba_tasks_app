// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/manger/cubit/department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/manger/cubit/department_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/update_department.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import '../../../../core/app_styles.dart';

class AddDepartmentScreen extends StatefulWidget {
  const AddDepartmentScreen({super.key});

  static const id = 'AddDepartmentScreen';

  @override
  State<AddDepartmentScreen> createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController assignedManager = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubitCubit(),
      child: BlocConsumer<DepartmentCubitCubit, DepartmentCubitState>(
        listener: (context, state) {
          if(state is AddDepartmentCubitSuccess){
            Navigator.of(context).pushNamed(UpdateDepartmentScreen.id);
            Fluttertoast.showToast(
                msg: "Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color(0xFF5A55CA),
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        builder: (context, state) {
          var departmentCubit = BlocProvider.of<DepartmentCubitCubit>(context);
          if(state is AddDepartmentCubitLoading){
            return Scaffold(
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }else if (state is AddDepartmentCubitFailure){
            return Scaffold(
              body: Center(
                child: Text(state.errmsg),
              ),
            );
          }else {
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
                              "New Department!",
                              textAlign: TextAlign.center,
                              style: AppStyles.titleStyle,
                              maxLines: 1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Create a new department now and assign a manager to start the work!",
                                    style: AppStyles.descriptionStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'name must not be empty.';
                                }else if(value!.length<3||value!.length>20){
                                  return 'the name must be 3 to 20 characters';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Name",
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

                            SizedBox(
                              height: 48 * SizeConfig.verticalBlock,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFF5A55CA),
                                ),
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    await departmentCubit.addDept(name: name.text);
                                  }
                                },
                                child: Text("Create",
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

        },
      ),
    );
  }
}
