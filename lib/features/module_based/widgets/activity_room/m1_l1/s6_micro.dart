import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';

class S6Micro extends ConsumerStatefulWidget {
  S6Micro({super.key});

  @override
  ConsumerState<S6Micro> createState() => _S6MicroState();
}

class _S6MicroState extends ConsumerState<S6Micro> {
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
          "A trademark is a symbol, word, or design that helps people identify a specific product or service and distinguish it from others. It's like a unique fingerprint for your brand. \n\nThink of it like this:",
          style: TextStyle(fontSize: 18.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "You: A cool boy at school \nYour name: What everyone calls you \nYour trademark: Your signature outfit or accessory that makes you stand out",
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          "assets/images/module/ipr4.jpg",
          height: 130.h,
        )
      ],
    ));
  }
}
