import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/views/widgets/create_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_task/presentation/views/create_task_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/views/widgets/create_user_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class AdminViewAppBar extends StatelessWidget {
  const AdminViewAppBar(
      {super.key, required this.dkey, required this.userType});
  final GlobalKey<ScaffoldState> dkey;
  final String userType;

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
        if (userType.contains('adm'))
          PopupMenuButton(
            onSelected: (item) {
              if (item == 0) {
                Navigator.of(context).pushNamed(CreateUSerScreen.id);
              } else if (item == 1) {
                Navigator.of(context).pushNamed(CreateDepScreen.id);
              } else {
                Navigator.of(context).pushNamed(CreateTaskScreen.id);
              }
            },
            icon: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryswatch,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 0,
                child: Text('Add User'),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text('Add Department'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Add Task'),
              ),
            ],
          ),
        if (userType.contains('mana'))
          PopupMenuButton(
            onSelected: (item) {
              if (item == 0) {
                Navigator.of(context).pushNamed(CreateUSerScreen.id);
              } else {
                Navigator.of(context).pushNamed(CreateTaskScreen.id);
              }
            },
            icon: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryswatch,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 0,
                child: Text('Add User'),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text('Add Task'),
              ),
            ],
          ),
      ],
    );
  }
}
