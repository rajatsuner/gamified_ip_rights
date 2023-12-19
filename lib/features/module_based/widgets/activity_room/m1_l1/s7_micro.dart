import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';

class S7Micro extends ConsumerStatefulWidget {
  S7Micro({super.key});

  @override
  ConsumerState<S7Micro> createState() => _S7MicroState();
}

class _S7MicroState extends ConsumerState<S7Micro> {
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
          "(ii) The shape of the bottle is also a trademark.",
          style: TextStyle(fontSize: 18.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Image.asset("assets/images/module/ipr5.jpg")
      ],
    ));
  }
}
