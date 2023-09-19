import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/department_bloc.dart';

import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UsersTap extends StatelessWidget {
  const UsersTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10 * SizeConfig.verticalBlock),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => const DepartmentSection(),
        separatorBuilder: (context, index) => SizedBox(
          height: 20 * SizeConfig.verticalBlock,
        ),
      ),
    );
  }
}
