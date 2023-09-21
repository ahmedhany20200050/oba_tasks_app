import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/tasks_view.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class TasksTap extends StatelessWidget {
  const TasksTap({super.key, required this.adcbt});
  final AdminViewCubit adcbt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9 * SizeConfig.verticalBlock),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime(2020, 1, 1),
              lastDate: DateTime(2026, 12, 31),
              onDateSelected: (date) {},
              monthColor: AppColors.lightprimaryswatch,
              dayColor: AppColors.darkprimaryswatch,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: AppColors.primaryswatch,
            ),
            SizedBox(height: 10 * SizeConfig.verticalBlock),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: adcbt.listOfTasks.length,
              itemBuilder: (context, index) => adcbt.listOfTasks.isEmpty
                  ? Center(
                      child: Text(
                        'No Tasks to show yet.',
                        style: AppStyles.textStyle16dark025w700,
                      ),
                    )
                  : adcbt.listOfTasks.length == 1
                      ? TasksView(
                          taskModel: adcbt.listOfTasks[0],
                          admincbt: adcbt,
                        )
                      : TasksView(
                          taskModel: adcbt.listOfTasks[index],
                          admincbt: adcbt,
                        ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 20 * SizeConfig.verticalBlock),
            ),
          ],
        ),
      ),
    );
  }
}
