import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/app_assets.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(57 * SizeConfig.verticalBlock);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      backgroundColor: AppColors.color0xFFF3FAF9,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24 * SizeConfig.horizontalBlock,
          ),
          child: Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: SvgPicture.asset(
                        AppAssets.menuIcon,
                        width: 18 * SizeConfig.horizontalBlock,
                        height: 12 * SizeConfig.verticalBlock,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    width: 19 * SizeConfig.horizontalBlock,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Today",
                        style: AppStyles
                            .color0xFF091E4AFontSize16FontWeightW700Height07AfterTheDecimalPointLetterSpacing25AfterTheDecimalPoint,
                      ),
                      SizedBox(
                        height: 5 * SizeConfig.verticalBlock,
                      ),
                      Text(
                        "11/9/2023",
                        style: AppStyles
                            .color0xFF7B808AFontSize12FontWeightW400Height17AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
