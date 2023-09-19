import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UserTasksDrawer extends StatelessWidget {
  const UserTasksDrawer({super.key, required this.logout});

  final void Function() logout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10 * SizeConfig.horizontalBlock,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10 * SizeConfig.verticalBlock),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    color: AppColors.primaryswatch,
                    child: TextButton(
                      onPressed: logout,
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
