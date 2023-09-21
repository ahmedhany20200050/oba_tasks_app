import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/data/models/admin_dep_model.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/views/widgets/update_user_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard(
      {super.key,
      required this.employee,
      required this.adcubit,
      required this.userType});
  final AdminManager employee;
  final AdminViewCubit adcubit;
  final String userType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightprimaryswatch.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8 * SizeConfig.horizontalBlock,
          vertical: 10 * SizeConfig.verticalBlock,
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 5),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 2,
                color: AppColors.primaryswatch,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee.name!,
                style: AppStyles.textStyle16dark025w700.copyWith(
                  letterSpacing: 0.44,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 7 * SizeConfig.verticalBlock,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: AppColors.lightprimaryswatch.withOpacity(0.1),
                ),
                child: Text(
                  employee.userType!,
                  style: AppStyles.textStyle8light044w400.copyWith(
                    color: AppColors.primaryswatch,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 4 * SizeConfig.verticalBlock,
              ),
              Icon(
                Icons.email_outlined,
                color: AppColors.lightprimaryswatch.withOpacity(0.5),
              ),
              Text(
                employee.email!,
                style: AppStyles.textStyle8light044w400.copyWith(
                  color: AppColors.lightprimaryswatch.withOpacity(0.9),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(
                Icons.local_phone_outlined,
                color: AppColors.lightprimaryswatch.withOpacity(0.5),
              ),
              Text(
                employee.phone!.toString(),
                style: AppStyles.textStyle8light044w400.copyWith(
                  color: AppColors.lightprimaryswatch.withOpacity(0.9),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (userType.contains('adm'))
                Align(
                  alignment: Alignment.bottomRight,
                  child: PopupMenuButton(
                    onSelected: (item) {
                      if (item == 0) {
                        Navigator.pushNamed(
                          context,
                          UpdateUserScreen.id,
                          arguments: employee,
                        );
                      } else {
                        adcubit.deleteUser(userid: employee.id!.toString());
                      }
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.primaryswatch,
                    ),
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text('Update User'),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text(
                          'Delete User',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (userType.contains('mana'))
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        UpdateUserScreen.id,
                        arguments: employee,
                      );
                    },
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.primaryswatch,
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
