import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightprimaryswatch.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8 * SizeConfig.horizontalBlock,
          vertical: 10 * SizeConfig.verticalBlock,
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 5),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 2,
                color: AppColors.primaryswatch,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Employee name',
                style: AppStyles.textStyle16dark025w700.copyWith(
                  letterSpacing: 0.44,
                ),
              ),
              SizedBox(
                height: 7 * SizeConfig.verticalBlock,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: AppColors.lightprimaryswatch.withOpacity(0.1),
                ),
                child: Text(
                  "ADMIN",
                  style: AppStyles.textStyle8light044w400.copyWith(
                    color: AppColors.primaryswatch,
                  ),
                ),
              ),
              SizedBox(
                height: 4 * SizeConfig.verticalBlock,
              ),
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: AppColors.lightprimaryswatch.withOpacity(0.5),
                  ),
                  Text(
                    'user email',
                    style: AppStyles.textStyle8light044w400.copyWith(
                      color: AppColors.lightprimaryswatch.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_phone_outlined,
                    color: AppColors.lightprimaryswatch.withOpacity(0.5),
                  ),
                  Text(
                    'user email',
                    style: AppStyles.textStyle8light044w400.copyWith(
                      color: AppColors.lightprimaryswatch.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
