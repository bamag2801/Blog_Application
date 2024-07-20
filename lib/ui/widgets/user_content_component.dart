import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog_app/constants/app_colors.dart';
import 'package:blog_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserContentComponent extends StatefulWidget {
  final String? image;
  final String? userName;
  final String? userEmail;
  final String? userId;

  const UserContentComponent(
      {super.key, this.image, this.userName, this.userId, this.userEmail});

  @override
  State<UserContentComponent> createState() => _UserContentComponentState();
}

class _UserContentComponentState extends State<UserContentComponent> {
  List<Color> colorizeColors = [
    Colors.white,
    Colors.purple,
    Colors.white,
    Colors.red,
  ];
  TextStyle colorizeTextStyle = TextStyle(
      fontSize: 18.sp, fontFamily: 'SF-Pro', fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15.r),
          margin: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.primaryColor,
          ),
          width: 330.w,
          height: 100.h,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage(widget.image!),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          widget.userName!,
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 180.w,
                        child: AnimatedTextKit(
                          /* softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          widget.userEmail!,
                          style: AppStyles.emailTextStyle,*/
                          animatedTexts: [
                            TyperAnimatedText(widget.userEmail!,
                                textStyle: AppStyles.emailTextStyle),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 15.r,
          top: 15.r,
          child: Container(
              height: 25.h,
              width: 120.w,
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, bottom: 4.0, top: 5.0),
              decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(10.0))),
              child: Center(
                child: Text(
                  "Id : ${widget.userId}",
                  style: AppStyles.emailTextStyle,
                ),
              )),
        ),
      ],
    );
  }
}
