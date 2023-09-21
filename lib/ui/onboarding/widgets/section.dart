// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';
import 'package:gamified_ip_rights/ui/onboarding/onboarding_screen.dart';
import 'package:lottie/lottie.dart';

class OnboardSection extends StatelessWidget {
  String title;
  String subtitle;
  bool isLottie;
  String lottieName;
  String imageName;
  OnboardSection(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.isLottie = true,
      this.lottieName = '',
      this.imageName = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLottie
            ? LottieBuilder.asset(
                'assets/images/onboarding/$lottieName',
                width: double.infinity,
              )
            : Image.asset(
                'assets/images/onboarding/$imageName',
                width: 240.w,
              ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.sp,
                fontFamily: 'Aeonik',
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp, color: AppColors.black.withOpacity(0.5)),
          ),
        )
      ],
    );
  }
}

List<Widget> onboardingList = [
  OnboardSection(
    title: "Intellecutal Property",
    subtitle: "Learn about various IP rights with fun",
    lottieName: 'ip.json',
  ),
  OnboardSection(
    title: "Modular Learning",
    subtitle: "Sections with basic, intermediate, advanced levels",
    lottieName: 'modular.json',
  ),
  OnboardSection(
    title: "Personalization",
    subtitle:
        "Provide personalized learning paths with ML, daily goal, schedule",
    lottieName: 'personalized.json',
  ),
  OnboardSection(
    title: "Virtual Museum",
    subtitle: "Explore famous IP rights cases with timeline and trivia",
    lottieName: 'museum.json',
  ),
  OnboardSection(
    title: "Augmented Reality",
    subtitle: "Understand topics enrich with AR/VR based content",
    lottieName: 'ar.json',
  ),
  OnboardSection(
    title: "Connect & Share",
    subtitle: "Connect with fellow students, seek experts help, AI chatbot",
    lottieName: 'community.json',
  ),
  OnboardSection(
    title: "Certificates",
    subtitle: "Get certified by completing modules and tests",
    lottieName: 'certificate.json',
  ),
  OnboardSection(
    title: "Leaderboard",
    subtitle: "Compete with others and earn trophies",
    lottieName: 'trophy.json',
  ),
  OnboardSection(
    title: "Daily Streak",
    subtitle: "Engage in continous and make habit of daily learning",
    lottieName: 'calendar.json',
  ),
];
