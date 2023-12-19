import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';

class S5Micro extends ConsumerStatefulWidget {
  S5Micro({super.key});

  @override
  ConsumerState<S5Micro> createState() => _S5MicroState();
}

class _S5MicroState extends ConsumerState<S5Micro> {
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
          "(i) The Coca Cola with the ® symbol is a ‘trademark’.",
          style: TextStyle(fontSize: 20.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Now what does a trademark mean?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
        ),
        Text(
          "Imagine your favourite superhero. \nWhat's the first thing that comes to mind? Their logo, right? That's the power of a trademark!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Image.asset("assets/images/module/ipr3.jpg")
      ],
    ));
  }
}
