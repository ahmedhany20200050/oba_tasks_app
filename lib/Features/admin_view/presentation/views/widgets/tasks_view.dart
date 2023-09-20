import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/data/models/task_model.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key, required this.admincbt, required this.taskModel});
  final AdminViewCubit admincbt;
  final TaskModel taskModel;

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
                        Icon(
                          Icons.more_vert_rounded,
                          color: AppColors.lightprimaryswatch.withOpacity(0.6),
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
        )
      ],
    );
  }
}
