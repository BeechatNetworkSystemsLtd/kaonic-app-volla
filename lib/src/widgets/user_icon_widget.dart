import 'package:flutter/material.dart';
import 'package:kaonic/theme/theme.dart';

class UserIconWidget extends StatelessWidget {
  const UserIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.white,
      child: Icon(
        Icons.person,
        color: AppColors.dark,
      ),
    );
  }
}
