import 'package:blog_app/constants/app_colors.dart';
import 'package:blog_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListComponent extends StatelessWidget {
  final String? userName;
  final String? image;
  final GestureTapCallback? onTap;

  const UserListComponent({super.key, this.userName, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 330.w,
            height: 78.h,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15.r))),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage(image!),
                ),
                title: Text(
                  userName!,
                  style: AppStyles.userNameTextStyle,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 9.h,)
        ],
      ),
    );
  }
}
