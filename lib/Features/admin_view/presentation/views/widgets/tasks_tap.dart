import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/tasks_view.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class TasksTap extends StatelessWidget {
  const TasksTap({super.key});

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
              firstDate: DateTime(2020, 4, 20),
              lastDate: DateTime(2025, 12, 31),
              onDateSelected: (date) {},
              monthColor: AppColors.lightprimaryswatch,
              dayColor: AppColors.darkprimaryswatch,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: AppColors.primaryswatch,
            ),
            SizedBox(height: 20 * SizeConfig.verticalBlock),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => const TasksView(),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 20 * SizeConfig.verticalBlock),
            ),
          ],
        ),
      ),
    );
  }
}
