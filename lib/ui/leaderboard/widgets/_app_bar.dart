import 'package:flutter/material.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

class LeaderAppBar extends AppBar {
  @override
  Color? get backgroundColor => AppColors.white;
  @override
  // TODO: implement automaticallyImplyLeading
  bool get automaticallyImplyLeading => false;
  @override
  Widget? get title => Text(
        "Leaderboard",
        style: TextStyle(
            letterSpacing: 0.2,
            fontFamily: 'Aeonik',
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      );

  @override
  PreferredSizeWidget? get bottom => PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Divider(
        height: 1,
        color: AppColors.grey.withOpacity(0.3),
      ));
}
