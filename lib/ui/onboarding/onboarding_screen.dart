import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/router.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';
import 'package:gamified_ip_rights/ui/onboarding/widgets/section.dart';

final onboardGuideProvider = StateProvider((ref) => 0);

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _controller;

  _nextPart() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  _previousPart() {
    _controller.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  _onPageChanged(WidgetRef ref, int index) {
    print("Page $index");
    ref.read(onboardGuideProvider.notifier).update((state) => index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = ref.watch(onboardGuideProvider);
    return Scaffold(
      // backgroundColor: Colors.grey.withOpacity(0.1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.grey.withOpacity(0.1),
              ]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 600.h,
                child: PageView.builder(
                    onPageChanged: (value) {
                      _onPageChanged(ref, value);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: onboardingList.length,
                    itemBuilder: ((context, index) {
                      return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: onboardingList[index]);
                    })),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPageIndex != 0
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          width: 60.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: AppColors.blueGray,
                              borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onTap: () => _previousPart(),
                            child: Icon(
                              Icons.skip_previous,
                              size: 30,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 60.w,
                          height: 40.h,
                        ),
                  currentPageIndex != (onboardingList.length - 1)
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          width: 60.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: AppColors.blueGray,
                              borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onTap: () => _nextPart(),
                            child: Icon(
                              Icons.skip_next,
                              size: 30,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          width: 120.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: AppColors.blueGray,
                              borderRadius: BorderRadius.circular(30.w)),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoute.home.path);
                              },
                              child: Text(
                                "Start Journey",
                                style: TextStyle(
                                  color: AppColors.white,
                                ),
                              )),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
