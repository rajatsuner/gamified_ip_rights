import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s2_micro.dart';

class S3Micro extends ConsumerStatefulWidget {
  S3Micro({super.key});

  @override
  ConsumerState<S3Micro> createState() => _S3MicroState();
}

class _S3MicroState extends ConsumerState<S3Micro> {
  int subTaskNumber = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  //8
  startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
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
            "It protects your ideas and work, like inventions, songs, stories, and even designs, from being used by anyone else without your permission",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
          ),
          Image.asset("assets/images/module/ipr1.jpg")
        ],
      ),
    );
  }
}
