import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';

class S1Micro extends ConsumerStatefulWidget {
  S1Micro({super.key});

  @override
  ConsumerState<S1Micro> createState() => _S1MicroState();
}

class _S1MicroState extends ConsumerState<S1Micro> {
  int subTaskNumber = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  //5
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
            "Hii, let's talk about IP Rights",
            textStyle: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
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
