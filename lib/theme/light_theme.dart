import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: AppColors.hightLightColor,
    labelColor: Colors.black,
    unselectedLabelColor: AppColors.subTitleColor,
    unselectedLabelStyle: TextStyle(
      color: AppColors.subTitleColor,
      fontSize: 20.sp,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
    ),
    labelStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.sp,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
    ),
  ),
);

extension CustomTextThemeName on TextTheme {
  TextStyle get errorTitle => TextStyle(
        color: AppColors.titleColor,
        fontSize: 20.sp,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      );
  TextStyle get errorSubtitle => TextStyle(
        color: AppColors.subTitleColor,
        fontSize: 12.sp,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 1.h,
      );
  TextStyle get itemTitle => TextStyle(
        color: AppColors.titleColor,
        fontSize: 20.sp,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      );
  TextStyle get itemUser => TextStyle(
        color: AppColors.hightLightColor,
        fontSize: 15.sp,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
      );
  TextStyle get itemRolePlay => TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
      );
  TextStyle get itemDate => TextStyle(
        color: AppColors.subTitleColor,
        fontSize: 12.sp,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );
  TextStyle get itemDescription => TextStyle(
        color: AppColors.descriptionColor,
        fontSize: 12.sp,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );
}
