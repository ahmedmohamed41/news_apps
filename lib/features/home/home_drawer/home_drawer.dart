import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, this.onClicked});
  final void Function()? onClicked;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.black,
      child: Column(
        children: [
          Container(
            alignment: AlignmentGeometry.center,
            color: ColorsManager.white,
            width: double.infinity,
            height: 166.h,
            child: Text(
              'News App',
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: onClicked,
              child: Row(
                spacing: 7.w,
                children: [
                  const Icon(
                    CupertinoIcons.home,
                    color: ColorsManager.white,
                  ),
                  Text(
                    'Go To Home',
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Divider(
            indent: 16.w,
            endIndent: 16.w,
            color: ColorsManager.white,
          ),
        ],
      ),
    );
  }
}
