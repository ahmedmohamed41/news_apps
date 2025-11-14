import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/provider/config_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, this.onClicked});
  final void Function()? onClicked;
  @override
  Widget build(BuildContext context) {
    final providerConfig = Provider.of<ConfigProvider>(context);
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
                    S.of(context).go_to_home,
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
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  spacing: 7.w,
                  children: [
                    const Icon(
                      Icons.format_paint_outlined,
                      color: ColorsManager.white,
                    ),
                    Text(
                      S.of(context).theme,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Text(
                      providerConfig.isDark
                          ? S.of(context).dark
                          : S.of(context).light,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      ),
                    ),
                    const Spacer(),
                    AnimatedToggleSwitch<bool>.dual(
                      current: providerConfig.isDark,
                      first: false,
                      second: true,
                      spacing: 5.0,
                      style: const ToggleStyle(
                        backgroundColor: Colors.grey,
                        borderColor: Colors.transparent,
                      ),
                      borderWidth: 3.0,
                      height: 50,
                      onChanged: (value) => providerConfig.toggleTheme(value),
                      iconBuilder: (value) => value
                          ? const Icon(Icons.dark_mode, color: Colors.white)
                          : const Icon(Icons.light_mode, color: Colors.yellow),
                      // textBuilder: (value) => Center(
                      //   child: Text(
                      //     value ? S.of(context).dark : S.of(context).light,
                      //     style: const TextStyle(fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  spacing: 7.w,
                  children: [
                    const Icon(
                      Icons.language_outlined,
                      color: ColorsManager.white,
                    ),
                    Text(
                      S.of(context).languages,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Text(
                      providerConfig.currentlanguage == 'en'
                          ? S.of(context).english
                          : S.of(context).arabic,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      ),
                    ),
                    const Spacer(),
                    AnimatedToggleSwitch<String>.dual(
                      current: providerConfig.currentlanguage,
                      first: 'en',
                      second: 'ar',
                      spacing: 5.0,
                      style: const ToggleStyle(
                        backgroundColor: Colors.grey,
                        borderColor: Colors.transparent,
                      ),
                      borderWidth: 3.0,
                      height: 50,
                      onChanged: (value) =>
                          providerConfig.chanegLanguage(value),
                      iconBuilder: (value) => value == 'en'
                          ? const Text(
                              'En',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.white,
                              ),
                            )
                          : const Text(
                              'Ar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.white,
                              ),
                            ),
                      // textBuilder: (value) => Center(
                      //   child: Text(
                      //     value == 'en'
                      //         ? S.of(context).english
                      //         : S.of(context).arabic,
                      //     style: const TextStyle(fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
