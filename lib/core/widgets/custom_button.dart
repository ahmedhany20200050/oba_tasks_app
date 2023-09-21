import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final void Function()? onTap;
  const CustomButton({super.key, required this.textButton, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: 16 * SizeConfig.horizontalBlock,
            vertical: 16 * SizeConfig.verticalBlock),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.color0xFF5A55CA,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          shadows: const [
            BoxShadow(
              color: AppColors.color0x3D000000,
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Text(textButton,textAlign: TextAlign.center,style: AppStyles.colorWhiteFontSize14FontWeightW500,),
      ),
    );
  }
}
