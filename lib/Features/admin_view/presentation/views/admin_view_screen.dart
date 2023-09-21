import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_state.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/userview_appbar.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/custom_tapbar.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/tasks_tap.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/the_drawer.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/views/widgets/user_tap.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class AdminViewScreen extends StatefulWidget {
  const AdminViewScreen({super.key});
  static const id = 'UserViewScreen';

  @override
  State<AdminViewScreen> createState() => _AdminViewScreenState();
}

class _AdminViewScreenState extends State<AdminViewScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminViewCubit, AdminViewStates>(
      listener: (context, state) {
        if (state is AdminGetAllDeps) {
          if (state.code == 500) {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.id, (route) => false);
          }
        }
        if (state is AdminDeleteTaskSuccess) {
          BlocProvider.of<AdminViewCubit>(context).adminAllTasks();
          customSnakbar(
            context,
            const SnackBar(
              content: Text('Task deleted successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is AdminDeleteUserSuccess) {
          BlocProvider.of<AdminViewCubit>(context).adminAllDeparts();
          customSnakbar(
            context,
            const SnackBar(
              content: Text('User deleted successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is AdminDeleteUserFailure) {
          customSnakbar(
            context,
            SnackBar(
              content: Text(state.errmsg),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        var adminCbt = BlocProvider.of<AdminViewCubit>(context);
        return Scaffold(
          key: scaffoldKey,
          drawer: AdminViewDrawer(
            logout: () {
              adminCbt.logout(context);
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24 * SizeConfig.horizontalBlock,
              vertical: 20 * SizeConfig.verticalBlock,
            ),
            child: SafeArea(
              child: adminCbt.listOfTasks.isEmpty && adminCbt.listOfDeps.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Column(
                      children: [
                        AdminViewAppBar(
                          dkey: scaffoldKey,
                          userType: adminCbt.usertype!,
                        ),
                        SizedBox(
                          height: 10 * SizeConfig.verticalBlock,
                        ),
                        CustomTapBar(
                          tabController: tabController!,
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              UsersTap(
                                adcbt: adminCbt,
                                userType: adminCbt.usertype!,
                              ),
                              TasksTap(
                                adcbt: adminCbt,
                              ),
                            ],
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
