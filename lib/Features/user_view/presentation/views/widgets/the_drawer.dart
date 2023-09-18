import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class TheDrawer extends StatelessWidget {
  const TheDrawer(
      {super.key,
      required this.addDep,
      required this.addUser,
      required this.updateDep,
      required this.updateUser});
  final void Function() addDep;
  final void Function() addUser;
  final void Function() updateDep;
  final void Function() updateUser;

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
                      onPressed: addDep,
                      child: const Text(
                        'Add Department',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10 * SizeConfig.verticalBlock),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    color: AppColors.primaryswatch,
                    child: TextButton(
                      onPressed: addUser,
                      child: const Text(
                        'Add User',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10 * SizeConfig.verticalBlock),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    color: AppColors.primaryswatch,
                    child: TextButton(
                      onPressed: updateUser,
                      child: const Text(
                        'Update User',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10 * SizeConfig.verticalBlock),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    color: AppColors.primaryswatch,
                    child: TextButton(
                      onPressed: updateDep,
                      child: const Text(
                        'Update Department',
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
