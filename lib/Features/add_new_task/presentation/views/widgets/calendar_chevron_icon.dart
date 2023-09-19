import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CalendarChevronIcon extends StatelessWidget {
  final Color backgroundColor;
  final String iconAsset;
  const CalendarChevronIcon({super.key, required this.backgroundColor, required this.iconAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 24 * SizeConfig.textRatio,
      height: 24 * SizeConfig.textRatio,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: SvgPicture.asset(
        iconAsset,
        width: 7 * SizeConfig.horizontalBlock,
        height: 9 * SizeConfig.verticalBlock,
      ),
    );
  }
}
