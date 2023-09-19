import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

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
                  "NEW",
                  style: AppStyles.textStyle16dark025w700.copyWith(
                    color: AppColors.primaryswatch,
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
                            children: [
                              Text(
                                'Create a High-Intensity Interval...',
                                style:
                                    AppStyles.textStyle16dark025w700.copyWith(
                                  letterSpacing: 0.44,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Design a 20-minute HIIT workout routine.',
                                style:
                                    AppStyles.textStyle12light015w400.copyWith(
                                  letterSpacing: 0.44,
                                  color: AppColors.lightprimaryswatch
                                      .withOpacity(0.6),
                                ),
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
                          'starts 12/9/2023 - ends 16/9/2023',
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
