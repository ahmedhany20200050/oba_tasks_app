import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/get_all_departments/get_all_departments_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/get_all_departments/get_all_departments_states.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/select_department/select_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/select_department/select_department_states.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/update_department/update_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manager/cubits/update_department/update_department_states.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_button.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_text_form_field.dart';

class UpdateDepartmentScreen extends StatefulWidget {
  const UpdateDepartmentScreen({super.key});
  static const String id = "UpdateDepartmentScreen";

  @override
  State<UpdateDepartmentScreen> createState() => _UpdateDepartmentScreenState();
}

class _UpdateDepartmentScreenState extends State<UpdateDepartmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _updatedDepartmentNameController =
      TextEditingController();
  final TextEditingController _managerIdController = TextEditingController();
  late int currentDepartmentId;
  late String currentDepartmentName;
  void selectDepartment(SelectDepartmentStates selectDepartmentState,
      String currentSelectedDepartmentName) {
    if (!(selectDepartmentState is SelectDepartmentSelect &&
        selectDepartmentState.departmentName ==
            currentSelectedDepartmentName)) {
      SelectDepartmentCubit.get(context)
          .selectDepartment(currentSelectedDepartmentName);
    }
  }

  @override
  void initState() {
    GetAllDepartmentsCubit.get(context).getAllDepartments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UpdateDepartmentCubit, UpdateDepartmentStates>(
        listener: (_, state) {
          if (state is UpdateDepartmentSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.successMessage)));
            GetAllDepartmentsCubit.get(context).getAllDepartments();
            if (currentDepartmentName !=
                _updatedDepartmentNameController.text) {
              SelectDepartmentCubit.get(context)
                  .selectDepartment(_updatedDepartmentNameController.text);
            }
          } else if (state is UpdateDepartmentFailure) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else {
            showDialog(
                context: context,
                builder: (_) => const Dialog(
                      child: Center(child: Text("Loading...")),
                    ));
          }
        },
        child: BlocConsumer<GetAllDepartmentsCubit, GetAllDepartmentsStates>(
            listener: (_, state) {
              if (state is GetAllDepartmentsSuccess) {
                currentDepartmentId = state.departments[0].id;
                currentDepartmentName = state.departments[0].name;
              }
            },
            listenWhen: (previous, current) =>
                current is GetAllDepartmentsSuccess,
            builder: (_, state) {
              if (state is GetAllDepartmentsSuccess) {
                return Container(
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
                                "Update Department!",
                                style: AppStyles.loginTextStyle1,
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20 * SizeConfig.verticalBlock,
                                    left: 38 * SizeConfig.horizontalBlock,
                                    right: 38 * SizeConfig.horizontalBlock),
                                child: Text(
                                    "Update department details and assign a new manager to continue work!",
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
                            controller: _updatedDepartmentNameController,
                            validator: (name) {
                              int length = name!.length;
                              if (length < 3 || length > 20) {
                                return "The name lenght must be between 3 and 20 characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20 * SizeConfig.verticalBlock,
                          ),
                          BlocBuilder<SelectDepartmentCubit,
                              SelectDepartmentStates>(
                            builder: (_, selectDepartmentState) =>
                                CustomTextFormField(
                              readOnly: true,
                              hintText: selectDepartmentState
                                      is SelectDepartmentSelect
                                  ? selectDepartmentState.departmentName
                                  : state.departments[0].name,
                              suffixIcon: DropdownButton(
                                underline: Container(
                                  height: 0,
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.grey),
                                items: state.departments.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                onChanged: (selectedDepartment) {
                                  currentDepartmentId = selectedDepartment!.id;
                                  currentDepartmentName =
                                      selectedDepartment.name;
                                  selectDepartment(selectDepartmentState,
                                      selectedDepartment.name);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20 * SizeConfig.verticalBlock,
                          ),
                          CustomTextFormField(
                            hintText: "Assigned Manager",
                            controller: _managerIdController,
                            validator: (managerId) {
                              try {
                                int.parse(managerId!);
                                return null;
                              } catch (_) {
                                return "Please, write a number";
                              }
                            },
                          ),
                          SizedBox(
                            height: 20 * SizeConfig.verticalBlock,
                          ),
                          CustomButton(
                              textButton: "UPDATE",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  UpdateDepartmentCubit.get(context)
                                      .updateDepartment(
                                          departmentName:
                                              _updatedDepartmentNameController
                                                  .text,
                                          managerId: _managerIdController.text,
                                          departmentId: currentDepartmentId);
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is GetAllDepartmentsFailure) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
