import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/views/widgets/employee_card.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class DepartmentSection extends StatelessWidget {
  const DepartmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50 * SizeConfig.horizontalBlock,
              child: Divider(
                thickness: 2,
                color: AppColors.lightprimaryswatch,
              ),
            ),
            SizedBox(
              width: 3 * SizeConfig.horizontalBlock,
            ),
            Text(
              'department name',
              style: AppStyles.textStyle12light015w400,
            ),
            SizedBox(
              width: 3 * SizeConfig.horizontalBlock,
            ),
            Icon(
              Icons.edit_document,
              size: 15,
              color: AppColors.lightprimaryswatch,
            )
          ],
        ),
        SizedBox(
          height: 5 * SizeConfig.verticalBlock,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 8 / 5.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => const EmployeeCard(),
        ),
      ],
    );
  }
}
