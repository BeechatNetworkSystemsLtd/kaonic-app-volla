import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaonic/data/models/contact_model.dart';
import 'package:kaonic/src/widgets/user_icon_widget.dart';
import 'package:kaonic/theme/text_styles.dart';
import 'package:kaonic/theme/theme.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.contact,
    required this.onTap,
    this.onIdentifyTap,
    this.nearbyFound = false,
    this.unreadCount,
  });

  final ContactModel contact;
  final Function() onTap;
  final Function()? onIdentifyTap;
  final bool nearbyFound;
  final int? unreadCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(42),
      child: Row(
        children: [
          UserIconWidget(),
          SizedBox(width: 10.w),
          Flexible(
            flex: 5,
            child: SizedBox(
              height: 32,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        contact.address,
                        style: TextStyles.text16.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: nearbyFound ? AppColors.negative : null,
                          border: nearbyFound
                              ? null
                              : Border.all(color: AppColors.white),
                        ),
                        child: const SizedBox(width: 8, height: 8),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
