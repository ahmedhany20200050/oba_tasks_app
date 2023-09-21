import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/department_bloc.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';

import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UsersTap extends StatelessWidget {
  const UsersTap({super.key, required this.adcbt, required this.userType});
  final AdminViewCubit adcbt;
  final String userType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10 * SizeConfig.verticalBlock),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: adcbt.listOfDeps.length,
        itemBuilder: (context, index) => adcbt.listOfDeps.isEmpty
            ? Center(
                child: Text(
                  "Wow, No Departments",
                  style: AppStyles.textStyle16dark025w700,
                ),
              )
            : adcbt.listOfDeps.length == 1
                ? DepartmentSection(
                    depModel: adcbt.listOfDeps[0],
                    userType: userType,
                    adminViewCubit: adcbt,
                  )
                : DepartmentSection(
                    depModel: adcbt.listOfDeps[index],
                    userType: userType,
                    adminViewCubit: adcbt,
                  ),
        separatorBuilder: (context, index) => SizedBox(
          height: 20 * SizeConfig.verticalBlock,
        ),
      ),
    );
  }
}
