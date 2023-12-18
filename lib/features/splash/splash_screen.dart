import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/features/auth/controller/auth_controller.dart';

import '../../core/assets/_icons.dart';
import '../../core/router.dart';
import '../../core/styles/colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(authControllerProvider.notifier).checkUserAlreadyLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: Center(
        child: Image.asset(
          AppIcons.logo.path,
          width: 180.w,
        ),
      )),
    );
  }
}
