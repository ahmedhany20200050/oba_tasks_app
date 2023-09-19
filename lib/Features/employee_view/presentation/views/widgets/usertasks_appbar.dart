import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UserTasksAppBar extends StatelessWidget {
  const UserTasksAppBar({super.key, required this.dkey});
  final GlobalKey<ScaffoldState> dkey;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: const Icon(
            Icons.menu_rounded,
            color: AppColors.darkprimaryswatch,
            size: 30,
          ),
          onTap: () {
            dkey.currentState!.openDrawer();
          },
        ),
        SizedBox(
          width: 19 * SizeConfig.horizontalBlock,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today",
              style: AppStyles.textStyle16dark025w700,
            ),
            SizedBox(
              height: 5 * SizeConfig.verticalBlock,
            ),
            Text(
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              style: AppStyles.textStyle12light015w400,
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              CircularPercentIndicator(
                radius: 25,
                lineWidth: 6,
                startAngle: 270,
                percent: 0.75,
                backgroundColor: Colors.green[100]!,
                animation: true,
                center: Text(
                  "15/20",
                  style: AppStyles.textStyle8light044w400.copyWith(
                    color: AppColors.darkprimaryswatch,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressColor: Colors.green,
              ),
              SizedBox(
                width: 20 * SizeConfig.horizontalBlock,
              ),
              CircularPercentIndicator(
                radius: 25,
                lineWidth: 6,
                percent: 0.25,
                startAngle: 270,
                backgroundColor: Colors.orange[100]!,
                animation: true,
                center: Text(
                  "5/20",
                  style: AppStyles.textStyle8light044w400.copyWith(
                    color: AppColors.darkprimaryswatch,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressColor: Colors.orange,
              ),
              SizedBox(
                width: 20 * SizeConfig.horizontalBlock,
              ),
              CircularPercentIndicator(
                radius: 25,
                lineWidth: 6,
                percent: 0.5,
                startAngle: 270,
                backgroundColor: Colors.red[100]!,
                animation: true,
                center: Text(
                  "10/20",
                  style: AppStyles.textStyle8light044w400.copyWith(
                    color: AppColors.darkprimaryswatch,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressColor: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
