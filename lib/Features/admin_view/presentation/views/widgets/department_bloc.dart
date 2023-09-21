import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/data/models/admin_dep_model.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/employee_card.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/widgets/update_dep_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/secure_storage.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class DepartmentSection extends StatelessWidget {
  const DepartmentSection(
      {super.key,
      required this.depModel,
      required this.userType,
      required this.adminViewCubit});
  final AdminDepModel depModel;
  final AdminViewCubit adminViewCubit;
  final String userType;

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
              depModel.name!,
              style: AppStyles.textStyle12light015w400,
            ),
            SizedBox(
              width: 3 * SizeConfig.horizontalBlock,
            ),
            if (userType.contains('adm'))
              GestureDetector(
                onTap: () {
                  SecureStorage.writeData(
                      key: 'depid', value: depModel.id.toString());
                  Navigator.pushNamed(context, UpdateDepScreen.id);
                },
                child: Icon(
                  Icons.edit_document,
                  size: 15,
                  color: AppColors.lightprimaryswatch,
                ),
              )
          ],
        ),
        SizedBox(
          height: 5 * SizeConfig.verticalBlock,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: depModel.employees!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: userType.contains('adm') ? 8 / 9 : 8 / 8.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => depModel.employees!.isEmpty
              ? Center(
                  child: Text(
                    "Wow, No Employees",
                    style: AppStyles.textStyle16dark025w700,
                  ),
                )
              : depModel.employees!.length == 1
                  ? EmployeeCard(
                      employee: depModel.employees![0],
                      adcubit: adminViewCubit,
                      userType: userType,
                    )
                  : EmployeeCard(
                      employee: depModel.employees![index],
                      adcubit: adminViewCubit,
                      userType: userType,
                    ),
        ),
      ],
    );
  }
}
