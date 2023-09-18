import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/update_department.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/Features/users_page/presentation/views/widgets/custom_card.dart';
import 'package:tasks_app_eraasoft/Features/users_page/presentation/views/widgets/tab_bar.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

import '../../../departmentForms/presentation/views/add_department.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  static const id = 'UsersScreen';

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  TabController? _tabController; // Create a key
  Future logout(context) async {
    try {
      // ignore: missing_required_param
      var storage = FlutterSecureStorage();
      var storage2 = await SharedPreferences.getInstance();
      await storage2.setBool("keepMeLoggedIn", false);
      String? token = await storage.read(key: "token");
      await storage.delete(key: "token");
      // print('logged out');
      Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.id,
        (route) => false,
      );
      await Api().post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
        token: token,
      );

      // ignore: unused_catch_clause
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  List<String> weekDays = ["Sun", "Mon", "Tus", "Wen", "Thu", "Fri", "Sat"];
  List<int> daysNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  logout(context);
                },
                child: const Text("Logout")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddDepartmentScreen.id);
                },
                child: const Text("Add Department")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(UpdateDepartmentScreen.id);
                },
                child: const Text("Update Department")),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 20 * SizeConfig.verticalBlock,
            horizontal: 24 * SizeConfig.horizontalBlock),
            child:SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.only(top: 4),
                        alignment: Alignment.topLeft,
                        onPressed: () => _key.currentState!.openDrawer(),
                        icon: Icon(Icons.menu_outlined),
                      ),
                      Column(
                        children: [
                          Text(
                            "Today",
                            style: AppStyles.homeTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "11/9/2023",
                            style: AppStyles.secondaryTextStyle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          padding: EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Icon(
                            size: 24,
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TabBar(
                    labelPadding: EdgeInsets.only(right: 32),
                    onTap: (value) {
                      setState(() {});
                    },
                    isScrollable: true,
                    controller: _tabController,
                    enableFeedback: true,
                    indicatorColor: AppColors.primaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.zero,
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              color: _tabController?.index == 0
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryColor,
                            ),
                            SizedBox(
                              width: 6 * SizeConfig.horizontalBlock,
                            ),
                            Text(
                              "USERS",
                              style: AppStyles.homeTitleStyle.copyWith(
                                color: _tabController?.index == 0
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Icon(
                              Icons.square_sharp,
                              color: _tabController?.index == 1
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryColor,
                            ),
                            SizedBox(
                              width: 6 * SizeConfig.horizontalBlock,
                            ),
                            Text(
                              "TASKS",
                              style: AppStyles.homeTitleStyle.copyWith(
                                color: _tabController?.index == 1
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10*SizeConfig.verticalBlock,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Contents of Tab 1
                        Column(
                          children: [

                            Expanded(
                              child: CustomScrollView(
                                physics: ClampingScrollPhysics(),
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Divider(
                                                  thickness: 2,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(" department name ",style: AppStyles.secondaryTextStyle,),
                                            ],
                                          ),
                                        ),
                                        Icon(FontAwesomeIcons.penToSquare,color: Colors.grey,size: 12,),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  SliverGrid.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: 150.0/100.0,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    children: [CustomCard(),CustomCard(),CustomCard(),CustomCard(),],

                                  ),
                                  SliverToBoxAdapter(child: SizedBox(height: 20*SizeConfig.verticalBlock,)),
                                  SliverToBoxAdapter(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            thickness: 2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(" department name ",style: AppStyles.secondaryTextStyle,),
                                        Icon(FontAwesomeIcons.penToSquare,color: Colors.grey,size: 12,),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  SliverGrid.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: 150.0/100.0,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    children: [CustomCard(),CustomCard(),CustomCard(),CustomCard(),],

                                  ),
                                  SliverToBoxAdapter(child: SizedBox(height: 20*SizeConfig.verticalBlock,)),
                                  SliverToBoxAdapter(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            thickness: 2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(" department name ",style: AppStyles.secondaryTextStyle,),
                                        Icon(FontAwesomeIcons.penToSquare,color: Colors.grey,size: 12,),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  SliverGrid.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: 150.0/100.0,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    children: [CustomCard(),CustomCard(),CustomCard(),CustomCard(),],

                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        // Contents of Tab 2
                        Text('Tab 2 content'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}


