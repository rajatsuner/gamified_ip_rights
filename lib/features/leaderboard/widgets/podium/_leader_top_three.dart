import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/leaderboard/widgets/podium/_rank_two.dart';

import 'package:lottie/lottie.dart';

import '_rank_one.dart';
import '_rank_three.dart';

class LeaderTopThree extends StatelessWidget {
  const LeaderTopThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [RankTwoPodium(), RankOnePodium(), RankThreePodium()],
    );
  }
}

class LeaderboardProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width * 0.1, 0);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width * 0.9, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
