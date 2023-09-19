import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/views/widgets/create_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/views/widgets/create_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/widgets/update_dep_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_user/presentation/views/widgets/update_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/manger/cubit/user_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/manger/cubit/user_view_state.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/views/widgets/userview_appbar.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/views/widgets/custom_tapbar.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/views/widgets/tasks_tap.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/views/widgets/the_drawer.dart';
import 'package:tasks_app_eraasoft/Features/user_view/presentation/views/widgets/user_tap.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UserViewScreen extends StatefulWidget {
  const UserViewScreen({super.key});
  static const id = 'UserViewScreen';

  @override
  State<UserViewScreen> createState() => _UserViewScreenState();
}

class _UserViewScreenState extends State<UserViewScreen>
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
    return BlocConsumer<UserViewCubit, UserViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userViewCbt = BlocProvider.of<UserViewCubit>(context);
        return Scaffold(
          key: scaffoldKey,
          drawer: UserViewDrawer(
            addDep: () {
              Navigator.pushNamed(context, CreateDepScreen.id);
            },
            addUser: () {
              Navigator.pushNamed(context, CreateUSerScreen.id);
            },
            updateDep: () {
              Navigator.pushNamed(context, UpdateDepScreen.id);
            },
            updateUser: () {
              Navigator.pushNamed(context, UpdateUserScreen.id);
            },
            logout: () {
              userViewCbt.logout(context);
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
                  UserViewAppBar(
                    dkey: scaffoldKey,
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
                      children: const [
                        UsersTap(),
                        TasksTap(),
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
