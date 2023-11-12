import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/features/gallery_item/presentation/provider/user_data_provider.dart';
import 'package:flutter_photo_gallery_webant/theme/app_colors.dart';
import 'package:flutter_photo_gallery_webant/theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RolePlayWidget extends StatelessWidget {
  const RolePlayWidget({
    super.key,
    required this.data,
  });
  final PhotoItemProvider data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        itemCount: data.item.roles.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.hightLightColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              data.item.roles[index],
              style: Theme.of(context).textTheme.itemRolePlay,
            ),
          );
        },
      ),
    );
  }
}
