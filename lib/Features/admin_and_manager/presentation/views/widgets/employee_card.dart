import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/Features/admin_and_manager/presentation/views/widgets/contact_info.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/app_assets.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class EmployeeCard extends StatelessWidget {
  final String employeeName;
  final String userEmail;
  final String userPhone;
  const EmployeeCard(
      {super.key,
      required this.employeeName,
      required this.userEmail,
      required this.userPhone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 10 * SizeConfig.verticalBlock,
          left: 8 * SizeConfig.horizontalBlock,
          right: 5 * SizeConfig.horizontalBlock,
          bottom: 10 * SizeConfig.verticalBlock),
      decoration: ShapeDecoration(
        color: AppColors.colorWhite,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.20 * SizeConfig.horizontalBlock,
              color: AppColors.color0xFF7B808A),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Container(
        // color: Colors.green,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1.55 * SizeConfig.horizontalBlock,
              height: 60 * SizeConfig.verticalBlock,
              color: AppColors.color0xFF5A55CA,
            ),
            SizedBox(
              width: 4.45 * SizeConfig.horizontalBlock,
            ),
            Container(
                padding:
                    EdgeInsets.only(right: 11 * SizeConfig.horizontalBlock),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employeeName,
                      style: AppStyles
                          .color0xFF091E4AFontSize16FontWeightW700Height05AfterTheDecimalPointLetterSpacing44AfterTheDecimalPoint,
                    ),
                    SizedBox(
                      height: 7 * SizeConfig.verticalBlock,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        color: AppColors.color0x195A55CA,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "ADMIN",
                        style: AppStyles
                            .color0xFF5A55CAFontSize8FontWeightW400Height16AfterTheDecimalPointLetterSpacing44AfterTheDecicmalPoint,
                      ),
                    ),
                    SizedBox(
                      height: 4 * SizeConfig.verticalBlock,
                    ),
                    ContactInfo(
                        contactText: userEmail,
                        contactIconAsset: AppAssets.mailIcon),
                    ContactInfo(
                        contactText: userPhone,
                        contactIconAsset: AppAssets.phoneIcon)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
