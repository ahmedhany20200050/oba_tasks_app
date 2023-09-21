import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_state.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/data/models/task_model.dart';
import 'package:tasks_app_eraasoft/Features/update_task/presentation/manger/cubit/update_task_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_task/presentation/manger/cubit/update_task_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key});
  static const id = 'UpdateTaskScreen';

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? name;
  String? descrip;
  int? selectedEployeId;
  int? selectedDepId;

  List<DateTime?> dats = [];

  String getValueText(
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
        valueText = '$startDate$endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  @override
  Widget build(BuildContext context) {
    TaskModel taskModel =
        ModalRoute.of(context)!.settings.arguments as TaskModel;

    return BlocBuilder<AdminViewCubit, AdminViewStates>(
      builder: (context, state) {
        return BlocConsumer<UpdateTaskCubit, UpdateTaskState>(
          listener: (context, state) {
            if (state is UpdateTaskSuccess) {
              BlocProvider.of<AdminViewCubit>(context).adminAllTasks();
              customSnakbar(
                context,
                const SnackBar(
                  content: Text('Task updated successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            }
            if (state is UpdateTaskFailure) {
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
            var updatetaskCbt = BlocProvider.of<UpdateTaskCubit>(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 24 * SizeConfig.horizontalBlock,
                    vertical: 48 * SizeConfig.verticalBlock),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Update Task!',
                          textAlign: TextAlign.center,
                          style: AppStyles.LoginTextStyle1,
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        SizedBox(
                          width: 274 * SizeConfig.horizontalBlock,
                          child: Text(
                            'Update task details and and assign it to employees right away.',
                            textAlign: TextAlign.center,
                            style: AppStyles.LogintextStyle2,
                          ),
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.darkprimaryswatch,
                            ),
                          ),
                          child: CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              firstDate: DateTime.now(),
                              calendarType: CalendarDatePicker2Type.range,
                              firstDayOfWeek: 1,
                              selectedDayHighlightColor:
                                  AppColors.primaryswatch,
                              selectedRangeDayTextStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              selectedRangeHighlightColor:
                                  AppColors.primaryswatch,
                              weekdayLabelTextStyle: const TextStyle(
                                color: AppColors.darkprimaryswatch,
                                fontWeight: FontWeight.bold,
                              ),
                              controlsTextStyle: const TextStyle(
                                color: AppColors.darkprimaryswatch,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: dats,
                            onValueChanged: (dates) {
                              setState(() {
                                dats = dates;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        TextFormField(
                          initialValue: taskModel.name,
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            hintStyle:
                                TextStyle(color: AppColors.darkprimaryswatch),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.darkprimaryswatch),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.darkprimaryswatch),
                            ),
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.length < 3 || value.length > 20) {
                              return 'Title must be between 3-20 characters';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        TextFormField(
                          initialValue: taskModel.description,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: 'Description',
                            hintStyle:
                                TextStyle(color: AppColors.darkprimaryswatch),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.darkprimaryswatch),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.darkprimaryswatch),
                            ),
                          ),
                          onChanged: (value) {
                            descrip = value;
                          },
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        const Text('Choose task status ID'),
                        SizedBox(
                          height: 10 * SizeConfig.verticalBlock,
                        ),
                        Column(
                          children: [
                            if (!taskModel.status!.contains('ne'))
                              Container(
                                height: 35 * SizeConfig.verticalBlock,
                                padding: EdgeInsets.only(
                                    right: 20 * SizeConfig.horizontalBlock),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: AppColors.primaryswatch,
                                        value: 0,
                                        groupValue:
                                            updatetaskCbt.radioSelection,
                                        onChanged: (value) {
                                          updatetaskCbt
                                              .radioSelectionChange(value);
                                        }),
                                    const Text('NEW')
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 10 * SizeConfig.verticalBlock,
                            ),
                            if (!taskModel.status!.contains('proce'))
                              Container(
                                height: 35 * SizeConfig.verticalBlock,
                                padding: EdgeInsets.only(
                                    right: 20 * SizeConfig.horizontalBlock),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: AppColors.primaryswatch,
                                        value: 1,
                                        groupValue:
                                            updatetaskCbt.radioSelection,
                                        onChanged: (value) {
                                          updatetaskCbt
                                              .radioSelectionChange(value!);
                                        }),
                                    const Text('PROCESSING')
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 10 * SizeConfig.verticalBlock,
                            ),
                            if (!taskModel.status!.contains('comp'))
                              Container(
                                height: 35 * SizeConfig.verticalBlock,
                                padding: EdgeInsets.only(
                                    right: 20 * SizeConfig.horizontalBlock),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: AppColors.primaryswatch,
                                        value: 2,
                                        groupValue:
                                            updatetaskCbt.radioSelection,
                                        onChanged: (value) {
                                          updatetaskCbt
                                              .radioSelectionChange(value!);
                                        }),
                                    const Text('COMPLETED')
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 10 * SizeConfig.verticalBlock,
                            ),
                            if (!taskModel.status!.contains('not'))
                              Container(
                                height: 35 * SizeConfig.verticalBlock,
                                padding: EdgeInsets.only(
                                    right: 20 * SizeConfig.horizontalBlock),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: AppColors.primaryswatch,
                                        value: 3,
                                        groupValue:
                                            updatetaskCbt.radioSelection,
                                        onChanged: (value) {
                                          updatetaskCbt
                                              .radioSelectionChange(value!);
                                        }),
                                    const Text('NOT COMPLETED')
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 10 * SizeConfig.verticalBlock,
                            ),
                            if (!taskModel.status!.contains('canc'))
                              Container(
                                height: 35 * SizeConfig.verticalBlock,
                                padding: EdgeInsets.only(
                                    right: 20 * SizeConfig.horizontalBlock),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: AppColors.primaryswatch,
                                        value: 4,
                                        groupValue:
                                            updatetaskCbt.radioSelection,
                                        onChanged: (value) {
                                          updatetaskCbt
                                              .radioSelectionChange(value!);
                                        }),
                                    const Text('CANCELED')
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 10 * SizeConfig.verticalBlock,
                            ),
                            if (!taskModel.status!.contains('exp'))
                              Container(
                                height: 35 * SizeConfig.verticalBlock,
                                padding: EdgeInsets.only(
                                    right: 20 * SizeConfig.horizontalBlock),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: AppColors.primaryswatch,
                                        value: 5,
                                        groupValue:
                                            updatetaskCbt.radioSelection,
                                        onChanged: (value) {
                                          updatetaskCbt
                                              .radioSelectionChange(value!);
                                        }),
                                    const Text('EXPIRED')
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        const Text('Choose employee ID'),
                        SizedBox(
                          height: 10 * SizeConfig.verticalBlock,
                        ),
                        DropdownSearch<int>(
                          items: updatetaskCbt.employsID,
                          selectedItem: taskModel.employee!.id,
                          onChanged: (value) {
                            selectedEployeId = value;
                          },
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        const Text('Choose department ID'),
                        SizedBox(
                          height: 10 * SizeConfig.verticalBlock,
                        ),
                        DropdownSearch<int>(
                          selectedItem: taskModel.department!.id,
                          items: updatetaskCbt.depsID,
                          onChanged: (value) {
                            selectedDepId = value;
                          },
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        SizedBox(
                          width: 312 * SizeConfig.horizontalBlock,
                          height: 48 * SizeConfig.verticalBlock,
                          child: ElevatedButton(
                              onPressed: () {
                                String? startD;
                                String? endD;
                                if (dats.isNotEmpty) {
                                  String date = getValueText(
                                      CalendarDatePicker2Type.range, dats);
                                  startD = date.split(' ')[0];
                                  endD = date.split(' ')[1];
                                }

                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<UpdateTaskCubit>(context)
                                      .updateTask(
                                    taskId: taskModel.id.toString(),
                                    name: name ?? taskModel.name!,
                                    description:
                                        descrip ?? taskModel.description!,
                                    status: updatetaskCbt.radioSelection
                                                .toString() ==
                                            'null'
                                        ? taskModel.status!
                                        : updatetaskCbt.radioSelection
                                            .toString(),
                                    startDate: startD ?? taskModel.startDate!,
                                    endDate: endD ?? taskModel.endDate!,
                                    employID:
                                        selectedEployeId.toString() == 'null'
                                            ? taskModel.employee!.id.toString()
                                            : selectedEployeId.toString(),
                                    depID: selectedDepId.toString() == 'null'
                                        ? taskModel.department!.id.toString()
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
