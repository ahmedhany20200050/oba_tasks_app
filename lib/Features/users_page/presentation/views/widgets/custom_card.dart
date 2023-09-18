import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_styles.dart';
import '../../../../../core/utils/size_config.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.20, color: Color(0xFF7B808A)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: AppColors.primaryColor,width: 2)
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Employee name",style: AppStyles.homeTitleStyle,),
              SizedBox(height: 8*SizeConfig.verticalBlock,),
              Text("ADMIN",style: AppStyles.secondaryTextStyle.copyWith(
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1)
              ),),
              SizedBox(height: 4*SizeConfig.verticalBlock,),
              Row(
                children: [
                  Icon(Icons.email_outlined,size: 12,),
                  Text("user email"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone_outlined,size: 12,),
                  Text("user email"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
