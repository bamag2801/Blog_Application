import 'package:blog_app/constants/app_colors.dart';
import 'package:blog_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double barHeight = 40.0;
  final bool? isBackFunction;

  const CustomAppBarWidget({
    super.key,
    this.title = "",
    this.isBackFunction = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(barHeight + 50.0);



  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(barHeight + 40),
        child: ClipPath(
          clipper: WaveClip(),
          child: Container(
            color: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppBar(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  leading: isBackFunction!
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 25.0.r),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.white,
                              size: 23,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 25.0.r),
                    child: Text(title, style: AppStyles.headerTextStyle),
                  ),
                  centerTitle: true,
                ),
              ],
            ),
          ),
        ));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
