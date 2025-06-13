import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaonic/theme/text_styles.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Widget? actionButton;
  final bool showBackButton;

  const CustomAppbar({
    super.key,
    required this.title,
    this.actionButton,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: showBackButton
              ? BackButton(
                  color: Colors.white,
                )
              : SizedBox.shrink(),
        ),
        Expanded(
          flex: 3,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Align(
                child: Text(
                  title,
                  // S.of(context).settings,
                  textAlign: TextAlign.center,
                  style: TextStyles.text24.copyWith(color: Colors.white),
                ),
              )),
        ),
        Expanded(child: actionButton ?? SizedBox.shrink()),
      ],
    );
  }
}
