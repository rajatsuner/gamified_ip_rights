import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/router.dart';

class ActivitySummaryScreen extends ConsumerWidget {
  const ActivitySummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Level Completed",
                style: TextStyle(fontSize: 20.sp),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(AppRoute.home.path));
                  },
                  child: Text("CLOSE"))
            ],
          ),
        ),
      ),
    );
  }
}
