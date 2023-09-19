import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_task/data/models/employ_model.dart';
import 'package:tasks_app_eraasoft/Features/create_task/presentation/manger/cubit/create_task_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_task/presentation/manger/cubit/create_task_state.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});
  static const id = 'CreateTaskScreen';

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController namecon = TextEditingController();
  TextEditingController descripcon = TextEditingController();
  int? selectedEployeId;

  List<DateTime?> dats = [
    DateTime.now(),
    DateTime.now().add(
      const Duration(
        days: 5,
      ),
    ),
  ];

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
    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state is CreateTaskSuccess) {
          customSnakbar(
            context,
            const SnackBar(
              content: Text('Task created successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is CreateTaskFailure) {
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
        var cbt = BlocProvider.of<CreateTaskCubit>(context);
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
                      'Add New Task!',
                      textAlign: TextAlign.center,
                      style: AppStyles.LoginTextStyle1,
                    ),
                    SizedBox(
                      height: 20 * SizeConfig.verticalBlock,
                    ),
                    SizedBox(
                      width: 274 * SizeConfig.horizontalBlock,
                      child: Text(
                        'Create a new task now and assign it to employees right away.',
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
                          selectedDayHighlightColor: AppColors.primaryswatch,
                          selectedRangeDayTextStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          selectedRangeHighlightColor: AppColors.primaryswatch,
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
                      controller: namecon,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        hintStyle:
                            TextStyle(color: AppColors.darkprimaryswatch),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkprimaryswatch),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkprimaryswatch),
                        ),
                      ),
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title must not be empty';
                        } else if (value.length < 3 || value.length > 20) {
                          return 'Title must be between 3-20 characters';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20 * SizeConfig.verticalBlock,
                    ),

                    TextFormField(
                      controller: descripcon,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        hintStyle:
                            TextStyle(color: AppColors.darkprimaryswatch),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkprimaryswatch),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkprimaryswatch),
                        ),
                      ),
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Description must not be empty';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20 * SizeConfig.verticalBlock,
                    ),
                    const Text('Choose employee name'),
                    SizedBox(
                      height: 10 * SizeConfig.verticalBlock,
                    ),
                    DropdownButtonFormField(
                      items: cbt.mapOfEmploy
                          .map((item) => DropdownMenuItem<String>(
                                value: item.keys.first,
                                child: Text(item.keys.first),
                              ))
                          .toList(),
                      onChanged: (value) {
                        cbt.getIdValue(value);
                        print(cbt.selctedId);
                      },
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null) {
                          return 'Employee ID must not be choosen';
                        }
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
                            String date = getValueText(
                                CalendarDatePicker2Type.range, dats);
                            String startD = date.split(' ')[0];
                            String endD = date.split(' ')[1];

                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<CreateTaskCubit>(context)
                                  .createTask(
                                name: namecon.text,
                                description: descripcon.text,
                                startDate: startD,
                                endDate: endD,
                                employID: selectedEployeId.toString(),
                              );
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
                    // TextButton(onPressed: () {  }, child: ,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
