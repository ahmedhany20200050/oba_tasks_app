import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/views/update_department.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/views/login_screen.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

import '../../../../core/widgets/drawer.dart';
import '../../../departmentForms/presentation/views/add_department.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  List <String> weekDays=["Sun","Mon","Tus","Wen","Thu","Fri","Sat"];
  List <int> daysNumbers=[1,2,3,4,5,6,7,8,9,10,11,12];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const CustomDrawer(),
      body: Container(
        padding:  EdgeInsets.symmetric(vertical: 20*SizeConfig.verticalBlock,horizontal: 24*SizeConfig.horizontalBlock),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            Text("Today",style: AppStyles.homeTitleStyle,textAlign: TextAlign.center,),
                            SizedBox(
                              height: 4,
                            ),
                            Text("11/9/2023",style: AppStyles.secondaryTextStyle,),
                          ],
                        ),
                        const Spacer(),
                        SimpleCircularProgressBar(
                          size: 40,
                          progressStrokeWidth: 8,
                          backStrokeWidth: 6,
                          progressColors: const [Color(0xff94C68D)],
                          onGetText: (double value) {
                            return Text('${value.toInt()}%',style: AppStyles.homeProgressStyle,);
                          },
                          backColor: Color(0xff94C68D).withOpacity(0.4),

                          startAngle: 270,
                        ),
                        const SizedBox(width: 20,),
                        SimpleCircularProgressBar(
                          size: 40,
                          progressStrokeWidth: 8,
                          backStrokeWidth: 6,
                          progressColors: const [Color(0xFFFBA85B)],
                          onGetText: (double value) {
                            return Text('${value.toInt()}%',style: AppStyles.homeProgressStyle,);
                          },
                          backColor: Color(0xFFFBA85B).withOpacity(0.4),

                          startAngle: 270,
                        ),
                        const SizedBox(width: 20,),
                        SimpleCircularProgressBar(
                          size: 40,
                          progressStrokeWidth: 8,
                          backStrokeWidth: 6,
                          progressColors: const [Color(0xFFF87B7B)],
                          onGetText: (double value) {
                            return Text('${value.toInt()}%',style: AppStyles.homeProgressStyle,);
                          },
                          backColor: Color(0xFFF87B7B).withOpacity(0.4),

                          startAngle: 270,
                        ),
                        const SizedBox(width: 5,),
                      ],
                    ),
                    SizedBox(
                      height: 20*SizeConfig.verticalBlock,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          height: 24*SizeConfig.verticalBlock,
                          width: 24*SizeConfig.verticalBlock,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: OvalBorder(
                            ),
                          ),
                          child: Icon(Icons.keyboard_arrow_left_outlined),
                        ),
                        Text("September 2023",style: AppStyles.homeTitleStyle,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 24*SizeConfig.verticalBlock,
                            width: 24*SizeConfig.verticalBlock,
                            decoration: ShapeDecoration(
                              color: AppColors.primaryColor,
                              shape: OvalBorder(
                              ),
                            ),
                            child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.white,size: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10*SizeConfig.verticalBlock,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){},
                            onLongPress: (){},
                            child: Ink(
                              height: 36*SizeConfig.verticalBlock,
                              width: 36*SizeConfig.verticalBlock,
                              decoration: ShapeDecoration(
                                color: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.white,
                                size: 32*SizeConfig.verticalBlock,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 4),
                              height: 36*SizeConfig.verticalBlock,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10, itemBuilder: (BuildContext context, int index) {
                                    // Color textColor
                                    return Container(

                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            selectedIndex=index;
                                          });
                                        },
                                        child: Ink(
                                          height: double.infinity,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(weekDays[index%weekDays.length],style: AppStyles.calendarDayNamesStyle.copyWith(
                                                color: selectedIndex==index?AppColors.primaryColor:Color(0xB2111111),
                                              ),),
                                              Spacer(),
                                              Text(daysNumbers[index].toString(),style: AppStyles.calendarDayNamesStyle.copyWith(
                                                  color: selectedIndex==index?AppColors.primaryColor:AppColors.secondaryColor,
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
              childCount: 5,
                  (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.0*SizeConfig.verticalBlock),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    height: 150*SizeConfig.verticalBlock,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("New",style: AppStyles.homeTaskTitleStyle,),
                        Divider(thickness: 2,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColors.primaryColor,
                                width: 3,
                              )
                            )
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text("Create a High-Intensity Interval ...",overflow: TextOverflow.ellipsis,
                                  style: AppStyles.homeTitleStyle,),
                                  SizedBox(
                                    height: 26*SizeConfig.verticalBlock,
                                  ),
                                  Text("Design a 20-minute HIIT workout routine.",overflow: TextOverflow.ellipsis,
                                  style: AppStyles.secondaryTextStyle,),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){},
                                child: Ink(
                                  child: Icon(
                                    Icons.more_vert,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10*SizeConfig.horizontalBlock,
                            ),
                            Text("starts 12/9/2023 - ends 16/9/2023",style: AppStyles.homeTitleStyle.copyWith(
                              fontSize: 12*SizeConfig.textRatio,
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },

            ),
            )
          ],
        ),
      ),
    );
  }
}



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