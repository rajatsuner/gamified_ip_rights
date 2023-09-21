import 'package:flutter/material.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

class ActivityDownloading extends StatelessWidget {
  const ActivityDownloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Downloading",
      style: TextStyle(color: AppColors.white),
    );
  }
}
