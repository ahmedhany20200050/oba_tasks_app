import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/manger/cubit/employee_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/manger/cubit/employee_view_state.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/views/widgets/drawer.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/views/widgets/task_block.dart';
import 'package:tasks_app_eraasoft/Features/employee_view/presentation/views/widgets/usertasks_appbar.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
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
    return BlocConsumer<EmployeeViewCubit, EmployeeViewStates>(
      listener: (context, state) {
        if (state is EmployeeGetAllTasks) {
          if (state.code == 500) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
          }
        }
        if (state is EmployeeUpdateTaskSuccess) {
          BlocProvider.of<EmployeeViewCubit>(context).employeeAllTasks();
          customSnakbar(
              context,
              const SnackBar(
                content: Text('Task updated successfully'),
                backgroundColor: Colors.green,
              ));
        }
        if (state is EmployeeUpdateTaskFailure) {
          customSnakbar(
              context,
              SnackBar(
                content: Text(state.errmsg),
                backgroundColor: Colors.red,
              ));
        }
      },
      builder: (context, state) {
        var employeeCbt = BlocProvider.of<EmployeeViewCubit>(context);

        return Scaffold(
          key: scaffoldKey,
          drawer: EmployeeDrawer(
            logout: () {
              employeeCbt.logout(context);
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24 * SizeConfig.horizontalBlock,
              vertical: 20 * SizeConfig.verticalBlock,
            ),
            child: SafeArea(
              child: state is! EmployeeGetAllTasks
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Column(
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
                                  firstDate: DateTime(2020, 1, 1),
                                  lastDate: DateTime(2025, 12, 31),
                                  onDateSelected: (date) {},
                                  monthColor: AppColors.lightprimaryswatch,
                                  dayColor: AppColors.darkprimaryswatch,
                                  activeDayColor: Colors.white,
                                  activeBackgroundDayColor:
                                      AppColors.primaryswatch,
                                ),
                                SizedBox(height: 20 * SizeConfig.verticalBlock),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: employeeCbt.listOfTasks.length,
                                  itemBuilder: (context, index) =>
                                      employeeCbt.listOfTasks.isEmpty
                                          ? Center(
                                              child: Text(
                                                'No Tasks for you yet.',
                                                style: AppStyles
                                                    .textStyle16dark025w700,
                                              ),
                                            )
                                          : employeeCbt.listOfTasks.length == 1
                                              ? TasksBlock(
                                                  taskModel: employeeCbt
                                                      .listOfTasks[0],
                                                  emplcbt: employeeCbt,
                                                )
                                              : TasksBlock(
                                                  taskModel: employeeCbt
                                                      .listOfTasks[index],
                                                  emplcbt: employeeCbt,
                                                ),
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
