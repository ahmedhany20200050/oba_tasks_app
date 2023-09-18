import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/admin_and_manager/presentation/views/widgets/department_section.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_appbar.dart';

class AdminAndManagerScreen extends StatefulWidget {
  const AdminAndManagerScreen({super.key});
  static const String id = "AdminAndManagerScreen";

  @override
  State<AdminAndManagerScreen> createState() => _AdminAndManagerScreenState();
}

class _AdminAndManagerScreenState extends State<AdminAndManagerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const Drawer(),
      body: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(
            top: 20 * SizeConfig.verticalBlock,
            left: 24 * SizeConfig.horizontalBlock,
            right: 24 * SizeConfig.horizontalBlock,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                padding: EdgeInsets.zero,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                controller: _tabController,
                indicatorWeight: SizeConfig.horizontalBlock,
                indicatorColor: AppColors.color0xFF5A55CA,
                labelColor: AppColors.color0xFF5A55CA,
                unselectedLabelColor: AppColors.color0xFF091E4A,
                labelStyle: AppStyles
                    .color0xFF5A55CAFontSize12FontWeightW700Height08AfterTheDecimalPoint25AfterTheDecimalPoint,
                unselectedLabelStyle: AppStyles
                    .color0xFF091E4AFontSize12FontWeightW700Height08AfterTheDecimalPoint25AfterTheDecimalPoint,
                tabs: [
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 5 * SizeConfig.verticalBlock),
                    child: Row(
                      children: [
                        Icon(Icons.person, size: 12 * SizeConfig.textRatio),
                        SizedBox(
                          width: 5 * SizeConfig.horizontalBlock,
                        ),
                        const Text("USERS"),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 5 * SizeConfig.verticalBlock),
                    child: Row(
                      children: [
                        Icon(Icons.task, size: 14 * SizeConfig.textRatio),
                        SizedBox(
                          width: 5 * SizeConfig.horizontalBlock,
                        ),
                        const Text("TASKS"),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 9 * SizeConfig.verticalBlock,
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 20 * SizeConfig.verticalBlock),
                        child:
                            const DepartmentSection(departmentName: "Flutter"),
                      )
                    ],
                  ),
                  const Center(child: Text("SUIIIII")),
                ],
              ))
            ],
          )),
    );
  }
}
