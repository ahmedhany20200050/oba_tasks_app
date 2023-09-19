import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/manger/cubit/user_tasks_cubit.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/manger/cubit/user_tasks_state.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/views/widgets/drawer.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/views/widgets/task_block.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/views/widgets/usertasks_appbar.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class EmployeeViewScreen extends StatefulWidget {
  const EmployeeViewScreen({super.key});
  static const id = 'UserTasksScreen';

  @override
  State<EmployeeViewScreen> createState() => _EmployeeViewScreenState();
}

class _EmployeeViewScreenState extends State<EmployeeViewScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserTasksCubit, UserTasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        var usertasksCbt = BlocProvider.of<UserTasksCubit>(context);
        return Scaffold(
          key: scaffoldKey,
          drawer: UserTasksDrawer(
            logout: () {
              usertasksCbt.logout(context);
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24 * SizeConfig.horizontalBlock,
              vertical: 20 * SizeConfig.verticalBlock,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  UserTasksAppBar(dkey: scaffoldKey),
                  SizedBox(height: 20 * SizeConfig.verticalBlock),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CalendarTimeline(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020, 4, 20),
                            lastDate: DateTime(2025, 12, 31),
                            onDateSelected: (date) {},
                            monthColor: AppColors.lightprimaryswatch,
                            dayColor: AppColors.darkprimaryswatch,
                            activeDayColor: Colors.white,
                            activeBackgroundDayColor: AppColors.primaryswatch,
                          ),
                          SizedBox(height: 20 * SizeConfig.verticalBlock),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) => const TasksBlock(),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 20 * SizeConfig.verticalBlock),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
