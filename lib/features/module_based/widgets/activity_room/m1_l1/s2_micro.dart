import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s1_micro.dart';

class S2Micro extends ConsumerStatefulWidget {
  S2Micro({super.key});

  @override
  ConsumerState<S2Micro> createState() => _S2MicroState();
}

class _S2MicroState extends ConsumerState<S2Micro> {
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
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "Think of it like owning your own creations, just like owning a game or a book.",
            textStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
            speed: const Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(seconds: 3),
      ),
    );
  }
}
