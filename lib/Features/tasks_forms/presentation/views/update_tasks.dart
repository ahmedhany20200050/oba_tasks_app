import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tasks_app_eraasoft/core/widgets/drawer.dart';

import '../../../../core/app_styles.dart';
import '../../../../core/utils/size_config.dart';

class UpdateTasks extends StatefulWidget {
  const UpdateTasks({super.key});
  static const String id = "UpdateTasks";

  @override
  State<UpdateTasks> createState() => _UpdateTasksState();
}

class _UpdateTasksState extends State<UpdateTasks> {
  GlobalKey<FormState> formkey = GlobalKey();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 20 * SizeConfig.verticalBlock,
              horizontal: 24 * SizeConfig.horizontalBlock),
          child: Column(
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
                  SimpleCircularProgressBar(
                    size: 40,
                    progressStrokeWidth: 8,
                    backStrokeWidth: 6,
                    progressColors: const [Color(0xff94C68D)],
                    onGetText: (double value) {
                      return Text(
                        '${value.toInt()}%',
                        style: AppStyles.homeProgressStyle,
                      );
                    },
                    backColor: Color(0xff94C68D).withOpacity(0.4),
                    startAngle: 270,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SimpleCircularProgressBar(
                    size: 40,
                    progressStrokeWidth: 8,
                    backStrokeWidth: 6,
                    progressColors: const [Color(0xFFFBA85B)],
                    onGetText: (double value) {
                      return Text(
                        '${value.toInt()}%',
                        style: AppStyles.homeProgressStyle,
                      );
                    },
                    backColor: Color(0xFFFBA85B).withOpacity(0.4),
                    startAngle: 270,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SimpleCircularProgressBar(
                    size: 40,
                    progressStrokeWidth: 8,
                    backStrokeWidth: 6,
                    progressColors: const [Color(0xFFF87B7B)],
                    onGetText: (double value) {
                      return Text(
                        '${value.toInt()}%',
                        style: AppStyles.homeProgressStyle,
                      );
                    },
                    backColor: Color(0xFFF87B7B).withOpacity(0.4),
                    startAngle: 270,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 24 * SizeConfig.verticalBlock,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      maxLines: 2,
                      initialValue: "Create a High-Intensity Interval Training (HIIT) Workout Routine",
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        helperText: "tab to edit",
                        // hintText: "Create a High-Intensity Interval Training (HIIT) Workout Routine",
                        hintStyle: AppStyles.homeTitleStyle
                            .copyWith(fontSize: 18 * SizeConfig.textRatio),
                      ),
                      style: AppStyles.homeTitleStyle
                          .copyWith(fontSize: 18 * SizeConfig.textRatio),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 140*SizeConfig.verticalBlock,
                color: Colors.grey,
                child: Image.network("https://th.bing.com/th/id/OIP.O2dhHj5C5Yh1JnMxCDHqPwHaHa?pid=ImgDet&w=500&h=500&rs=1",fit: BoxFit.scaleDown,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
