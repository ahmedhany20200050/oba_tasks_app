import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.dkey});
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
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(3),
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
        ),
      ],
    );
  }
}
