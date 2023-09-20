import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/data/models/task_model.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/manger/cubit/employee_view_cubit.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class TasksBlock extends StatelessWidget {
  const TasksBlock({super.key, required this.taskModel, required this.emplcbt,});

  final TaskModel taskModel;
  final EmployeeViewCubit emplcbt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10 * SizeConfig.horizontalBlock,
              vertical: 10 * SizeConfig.verticalBlock,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.status!.toUpperCase(),
                  style: AppStyles.textStyle16dark025w700.copyWith(
                    color: taskModel.status!.contains('ne')
                        ? AppColors.primaryswatch
                        : taskModel.status!.contains('process')
                            ? Colors.amber
                            : taskModel.status!.contains('not')
                                ? Colors.cyan
                                : taskModel.status!.contains('complet')
                                    ? Colors.green
                                    : taskModel.status!.contains('expi')
                                        ? Colors.red
                                        : Colors.grey,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.44,
                  ),
                ),
                SizedBox(height: 5 * SizeConfig.verticalBlock),
                Divider(
                  thickness: 1.5,
                  color: AppColors.lightprimaryswatch,
                ),
                SizedBox(height: 10 * SizeConfig.verticalBlock),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250 * SizeConfig.horizontalBlock,
                          padding: EdgeInsets.only(
                              left: 10 * SizeConfig.horizontalBlock),
                          height: 52 * SizeConfig.verticalBlock,
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColors.primaryswatch,
                                width: 3 * SizeConfig.horizontalBlock,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                taskModel.name!,
                                style:
                                    AppStyles.textStyle16dark025w700.copyWith(
                                  letterSpacing: 0.44,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              Text(
                                taskModel.description!,
                                style:
                                    AppStyles.textStyle12light015w400.copyWith(
                                  letterSpacing: 0.44,
                                  color: AppColors.lightprimaryswatch
                                      .withOpacity(0.6),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) => Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          10 * SizeConfig.horizontalBlock,
                                      vertical: 10 * SizeConfig.verticalBlock,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            'UPDATE TASK STATUS',
                                            style: AppStyles
                                                .textStyle16dark025w700,
                                          ),
                                          SizedBox(
                                            height:
                                                10 * SizeConfig.verticalBlock,
                                          ),
                                          Container(
                                            height:
                                                35 * SizeConfig.verticalBlock,
                                            padding: EdgeInsets.only(
                                                right: 20 *
                                                    SizeConfig.horizontalBlock),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 0,
                                                    groupValue:
                                                        emplcbt.radioSelection,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        emplcbt
                                                            .radioSelectionChange(
                                                                value!);
                                                      });
                                                    }),
                                                const Text('NEW')
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                10 * SizeConfig.verticalBlock,
                                          ),
                                          Container(
                                            height:
                                                35 * SizeConfig.verticalBlock,
                                            padding: EdgeInsets.only(
                                                right: 20 *
                                                    SizeConfig.horizontalBlock),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 1,
                                                    groupValue:
                                                        emplcbt.radioSelection,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        emplcbt
                                                            .radioSelectionChange(
                                                                value!);
                                                      });
                                                    }),
                                                const Text('PROCESSING')
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                10 * SizeConfig.verticalBlock,
                                          ),
                                          Container(
                                            height:
                                                35 * SizeConfig.verticalBlock,
                                            padding: EdgeInsets.only(
                                                right: 20 *
                                                    SizeConfig.horizontalBlock),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 2,
                                                    groupValue:
                                                        emplcbt.radioSelection,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        emplcbt
                                                            .radioSelectionChange(
                                                                value!);
                                                      });
                                                    }),
                                                const Text('COMPLETED')
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                10 * SizeConfig.verticalBlock,
                                          ),
                                          Container(
                                            height:
                                                35 * SizeConfig.verticalBlock,
                                            padding: EdgeInsets.only(
                                                right: 20 *
                                                    SizeConfig.horizontalBlock),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 3,
                                                    groupValue:
                                                        emplcbt.radioSelection,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        emplcbt
                                                            .radioSelectionChange(
                                                                value!);
                                                      });
                                                    }),
                                                const Text('NOT COMPLETED')
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                10 * SizeConfig.verticalBlock,
                                          ),
                                          Container(
                                            height:
                                                35 * SizeConfig.verticalBlock,
                                            padding: EdgeInsets.only(
                                                right: 20 *
                                                    SizeConfig.horizontalBlock),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 4,
                                                    groupValue:
                                                        emplcbt.radioSelection,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        emplcbt
                                                            .radioSelectionChange(
                                                                value!);
                                                      });
                                                    }),
                                                const Text('CANCELED')
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                10 * SizeConfig.verticalBlock,
                                          ),
                                          Container(
                                            height:
                                                35 * SizeConfig.verticalBlock,
                                            padding: EdgeInsets.only(
                                                right: 20 *
                                                    SizeConfig.horizontalBlock),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 5,
                                                    groupValue:
                                                        emplcbt.radioSelection,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        emplcbt
                                                            .radioSelectionChange(
                                                                value!);
                                                      });
                                                    }),
                                                const Text('EXPIRED')
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                10 * SizeConfig.verticalBlock,
                                          ),
                                          SizedBox(
                                            width: 250 *
                                                SizeConfig.horizontalBlock,
                                            height:
                                                35 * SizeConfig.verticalBlock,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                emplcbt.employeeUpdateTask(
                                                  context: context,
                                                  taskID: taskModel.id!,
                                                  name: taskModel.name!,
                                                  description:
                                                      taskModel.description!,
                                                  startDate:
                                                      taskModel.startDate!,
                                                  endDate: taskModel.endDate!,
                                                  status: emplcbt.radioSelection
                                                      .toString(),
                                                  employID: taskModel
                                                      .employee!.id
                                                      .toString(),
                                                  depID: taskModel
                                                      .department!.id
                                                      .toString(),
                                                );
                                              },
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                  Color(0xFF5A55CA),
                                                ),
                                              ),
                                              child: Text(
                                                'UPDATE',
                                                style: AppStyles.textStyle14,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.more_vert_rounded,
                            color:
                                AppColors.lightprimaryswatch.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 23 * SizeConfig.verticalBlock),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.lightprimaryswatch.withOpacity(0.6),
                          size: 30,
                        ),
                        SizedBox(width: 10 * SizeConfig.horizontalBlock),
                        Text(
                          'starts ${taskModel.startDate} - ends ${taskModel.endDate}',
                          style: AppStyles.textStyle16dark025w700.copyWith(
                            fontSize: 12 * SizeConfig.textRatio,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20 * SizeConfig.verticalBlock,
        ),
      ],
    );
  }
}
