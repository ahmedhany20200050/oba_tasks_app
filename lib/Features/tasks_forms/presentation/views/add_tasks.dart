// ignore_for_file: body_might_complete_normally_nullable

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/manger/cubit/department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/manger/cubit/department_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/update_department.dart';
import 'package:tasks_app_eraasoft/Features/home/presentation/views/home_screen.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/data/models/employees_model.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/presentation/manger/home_screen_cubit/cubit/tasks_screens_cubit.dart';
import 'package:tasks_app_eraasoft/Features/tasks_forms/presentation/manger/home_screen_cubit/cubit/tasks_screens_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import '../../../../core/app_styles.dart';

final today = DateUtils.dateOnly(DateTime.now());

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  static const id = 'AddTasksScreen';

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  DateTime setDate = DateTime.now();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController assignedEmployee = TextEditingController();
  TextEditingController assignedDepartment = TextEditingController();




  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 3)),
  ];
  bool doIt=true;
  int empID =0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksScreenCubit(),
      child: BlocConsumer<TasksScreenCubit, TasksScreensState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<TasksScreenCubit>(context);
          if (doIt) {
            cubit.getEmployees();
            doIt = false;
          }
          return (state is AddTasksScreensFailed||state is GetEmpFailed)? Scaffold(
            body: Center(
              child: Text(
                state.errmsg??"",
              ),
            ),
          ):Scaffold(
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SafeArea(
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
                            "Add New Task!",
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
                                  "Create a new task now and assign it to employees right away.",
                                  style: AppStyles.descriptionStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          //todo: add calendar
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.textFieldColor, width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: _buildCalendarWithActionButtons()),

                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: title,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'title must not be empty.';
                              } else if (value.length < 3 ||
                                  value.length > 20) {
                                return 'the title must be 3 to 20 characters';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Title",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: AppColors.textFieldColor,
                                  width: 1,
                                ),
                              ),
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
                          TextFormField(
                            controller: description,
                            maxLines: 5,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'description must not be empty.';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Description",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: AppColors.textFieldColor,
                                  width: 1,
                                ),
                              ),
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
                          state is GetEmpSuccess?DropdownButtonFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              items: cubit.dropDownItems.map((Data d) {
                                return DropdownMenuItem(
                                  value: d.id.toString(),
                                  child: Text(d.name.toString()),
                                );
                              }).toList(),
                              value: cubit.dropDownItems.first.id.toString(),
                              onChanged: (value) {
                                this.empID=int.parse(value!);
                              }):Container(),
                          state is GetEmpLoading?Container(height:20,width: 20,child: CircularProgressIndicator()):Container(),
                          state is GetEmpSuccess?const SizedBox(
                            height: 24,
                          ):Container(),

                          SizedBox(
                            height: 48 * SizeConfig.verticalBlock,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF5A55CA),
                              ),
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  await cubit.addTask(
                                      this._rangeDatePickerWithActionButtonsWithValue,
                                      this.title.text,
                                      this.description.text,
                                      this.empID.toString(),
                                  );
                                }
                              },
                              child: Text("Create",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.buttonTextStyle),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildCalendarWithActionButtons() {
    final config = CalendarDatePicker2WithActionButtonsConfig(
      lastMonthIcon: Container(
        height: 24 * SizeConfig.verticalBlock,
        width: 24 * SizeConfig.verticalBlock,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: OvalBorder(),
        ),
        child: Icon(Icons.keyboard_arrow_left_outlined,
            color: Colors.white, size: 20),
      ),
      nextMonthIcon: Container(
        height: 24 * SizeConfig.verticalBlock,
        width: 24 * SizeConfig.verticalBlock,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: OvalBorder(),
        ),
        child: Icon(Icons.keyboard_arrow_left_outlined,
            color: Colors.white, size: 20),
      ),
      controlsTextStyle: AppStyles.homeTitleStyle,
      centerAlignModePicker: true,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: AppColors.primaryColor,
      disableModePicker: true,
      cancelButton: Container(),
      okButton: Container(),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CalendarDatePicker2WithActionButtons(
          config: config,
          value: _rangeDatePickerWithActionButtonsWithValue,
          onValueChanged: (dates) {
            setState(() {
              _rangeDatePickerWithActionButtonsWithValue = dates;
              Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
          },
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Selection(s):  '),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                _getValueText(
                  config.calendarType,
                  _rangeDatePickerWithActionButtonsWithValue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }
}
