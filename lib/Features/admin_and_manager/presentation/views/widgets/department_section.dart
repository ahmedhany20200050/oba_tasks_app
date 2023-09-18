import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app_eraasoft/Features/admin_and_manager/presentation/views/widgets/employee_card.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/app_assets.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class DepartmentSection extends StatelessWidget {
  final String departmentName;
  const DepartmentSection({super.key, required this.departmentName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 199 * SizeConfig.verticalBlock,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.6,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50 * SizeConfig.horizontalBlock,
                  height: SizeConfig.verticalBlock,
                  color: AppColors.color0xFF091E4A,
                ),
                SizedBox(
                  width: 3 * SizeConfig.horizontalBlock,
                ),
                Text(
                  departmentName,
                  style: AppStyles
                      .color0xFF091E4AFontSize12FontWeightW400Height17AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint,
                ),
                SizedBox(
                  width: 3 * SizeConfig.horizontalBlock,
                ),
                SvgPicture.asset(
                  AppAssets.editIcon,
                  width: 12 * SizeConfig.horizontalBlock,
                  height: 12 * SizeConfig.verticalBlock,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5 * SizeConfig.verticalBlock,
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150 * SizeConfig.verticalBlock,
                  crossAxisSpacing: 10 * SizeConfig.horizontalBlock,
                  mainAxisSpacing: 10 * SizeConfig.verticalBlock,
                  mainAxisExtent: 81 * SizeConfig.verticalBlock),
              children: const [
                EmployeeCard(
                    employeeName: "Basel",
                    userEmail: "ddd",
                    userPhone: "eeeee"),
                EmployeeCard(
                    employeeName: "Basel",
                    userEmail: "ddd",
                    userPhone: "eeeee"),
                EmployeeCard(
                    employeeName: "Basel",
                    userEmail: "ddd",
                    userPhone: "eeeee"),
                EmployeeCard(
                    employeeName: "Basel",
                    userEmail: "ddd",
                    userPhone: "eeeee"),
                EmployeeCard(
                    employeeName: "Basel",
                    userEmail: "ddd",
                    userPhone: "eeeee"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
