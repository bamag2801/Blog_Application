import 'package:blog_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static const font = 'SF-Pro';
  static TextStyle headerTextStyle = TextStyle(
      fontFamily: font,
      fontSize: 18.sp,
      color: AppColors.headerTextColor,
      fontWeight: FontWeight.bold);

  static TextStyle userNameTextStyle = TextStyle(
      fontFamily: font,
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeight.bold);
  static TextStyle emailTextStyle = TextStyle(
      fontFamily: font,
      fontSize: 14.sp,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis);
}
