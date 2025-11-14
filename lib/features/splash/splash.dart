import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/core/resources/routes_manager.dart';
import 'package:news_app/provider/config_provider.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  AssetManager.newsLogo,
                  color: provider.isDark
                      ? ColorsManager.white
                      : ColorsManager.black,
                  width: 180.w,
                  height: 180.h,
                ),
              ),
            ),
            const Spacer(),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                AssetManager.newsBranding,
                color: provider.isDark
                    ? ColorsManager.white
                    : ColorsManager.black,
                width: 214.w,
                height: 86.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
