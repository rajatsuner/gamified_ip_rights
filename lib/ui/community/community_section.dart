import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';
import 'package:lottie/lottie.dart';

class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Community",
          style: TextStyle(
              letterSpacing: 0.2,
              fontFamily: 'Aeonik',
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              color: AppColors.grey.withOpacity(0.3),
            )),
        actions: [
          // Icon(
          //   Icons.do_disturb,
          //   color: AppColors.black,
          // ),
          // SizedBox(
          //   width: 15,
          // )
        ],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/lotties/hello.json'),
          Text(
            "It will be implemented soon",
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
