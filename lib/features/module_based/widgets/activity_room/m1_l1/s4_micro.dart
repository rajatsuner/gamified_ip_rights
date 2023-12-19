import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';

class S4Micro extends ConsumerStatefulWidget {
  S4Micro({super.key});

  @override
  ConsumerState<S4Micro> createState() => _S4MicroState();
}

class _S4MicroState extends ConsumerState<S4Micro> {
  int subTaskNumber = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  //8
  startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      ref.read(continueProvider.notifier).update((state) => true);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          "Let's understand it with a Example Question",
          style: TextStyle(fontSize: 22.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          " Look at the Coca-Cola bottle in front of you. Can you identify the various intellectual property rights (IPRs) that exist in it?",
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          "assets/images/module/ipr2.jpg",
          height: 250.h,
        )
      ],
    ));
  }
}
