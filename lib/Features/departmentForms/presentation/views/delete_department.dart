// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/data/DepartmentsModel.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/manger/cubit/department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/manger/cubit/department_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import '../../../../core/app_styles.dart';

class DeleteDepartmentScreen extends StatefulWidget {
  const DeleteDepartmentScreen({super.key});

  static const id = 'DeleteDepartmentScreen';

  @override
  State<DeleteDepartmentScreen> createState() => _DeleteDepartmentScreenState();
}

class _DeleteDepartmentScreenState extends State<DeleteDepartmentScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController managerID = TextEditingController();
  bool doIt = true;
  late int deptID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubitCubit(),
      child: BlocConsumer<DepartmentCubitCubit, DepartmentCubitState>(
        listener: (context, state) {
          if (state is DeleteDepartmentCubitSuccess) {
            Fluttertoast.showToast(
                msg: "Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color(0xFF5A55CA),
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.of(context).pushNamed(HomeScreen.id);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<DepartmentCubitCubit>(context);
          //if initial state then get all departments for the drop down list
          if (doIt) {
            cubit.getDept();
            doIt = false;
          }
          if (state is DeleteDepartmentCubitLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is DeleteDepartmentCubitFailure) {
            return Scaffold(
              body: Center(
                child: Text(state.errmsg),
              ),
            );
          } else {
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
                          "Delete Department!",
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
                                "Delete  Department!",
                                style: AppStyles.descriptionStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 24 * SizeConfig.verticalBlock,
                        ),
                        state is GetDepartmentCubitSuccess
                            ? DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                items: cubit.dropDownItems.map((Department d) {
                                  return DropdownMenuItem(
                                    value: d.id.toString(),
                                    child: Text(d.name.toString()),
                                  );
                                }).toList(),
                                value: cubit.dropDownItems.first.id.toString(),
                                onChanged: (value) {
                                  this.deptID = int.parse(value!);
                                })
                            : Container(),
                        state is GetDepartmentCubitSuccess
                            ? SizedBox(
                                height: 24,
                              )
                            : Center(
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator())),
                        SizedBox(
                          height: 48 * SizeConfig.verticalBlock,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF5A55CA),
                            ),
                            onPressed: () async {
                              cubit.deleteDept(deptID: deptID);
                            },
                            child: Text(
                              "Delete",
                              textAlign: TextAlign.center,
                              style: AppStyles.buttonTextStyle,
                            ),
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
