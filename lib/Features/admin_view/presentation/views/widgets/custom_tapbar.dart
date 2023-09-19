import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';

class CustomTapBar extends StatefulWidget {
  const CustomTapBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

class _CustomTapBarState extends State<CustomTapBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        isScrollable: true,
        indicatorColor: AppColors.primaryswatch,
        indicatorSize: TabBarIndicatorSize.label,
        controller: widget.tabController,
        onTap: (value) => setState(() {}),
        tabs: [
          Tab(
            child: Row(
              children: [
                Icon(
                  Icons.person_2_outlined,
                  color: widget.tabController.index == 0
                      ? AppColors.primaryswatch
                      : AppColors.darkprimaryswatch,
                ),
                Text(
                  'USERS',
                  style: AppStyles.textStyle12light015w400.copyWith(
                    color: widget.tabController.index == 0
                        ? AppColors.primaryswatch
                        : AppColors.darkprimaryswatch,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.25,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              children: [
                Icon(
                  Icons.task_outlined,
                  color: widget.tabController.index == 1
                      ? AppColors.primaryswatch
                      : AppColors.darkprimaryswatch,
                ),
                Text(
                  'TASKS',
                  style: AppStyles.textStyle12light015w400.copyWith(
                    color: widget.tabController.index == 1
                        ? AppColors.primaryswatch
                        : AppColors.darkprimaryswatch,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
