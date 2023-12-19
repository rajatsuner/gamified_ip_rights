import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_font.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/current_question_point.dart';

class S8McqText extends ConsumerStatefulWidget {
  const S8McqText({super.key});

  @override
  ConsumerState<S8McqText> createState() => _S8McqTextState();
}

class _S8McqTextState extends ConsumerState<S8McqText> {
  bool enableOption = true;
  bool showAnswer = false;
  String answerText = "";
  Color answerColor = Colors.black;

  _selectOption(String option) {
    if (enableOption == false) {
      return;
    }
    enableOption = false;
    showAnswer = true;
    if (option != "c") {
      answerText = "No, its wrong answer. Correct Answer is (c)Trademark";
      answerColor = Colors.red;
    } else {
      answerText = "Yes, (c)Trademark is correct answer";
      answerColor = Colors.green;
    }
    setState(() {});
    ref.read(continueProvider.notifier).update((state) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "What type of intellectual property right protects the shape of a unique bottle design?",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 30.h,
        ),
        InkWell(
          onTap: () => _selectOption("a"),
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 2.w),
                borderRadius: BorderRadius.circular(10.w)),
            child: Text(
              "a) Copyright",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.aeonik.name),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () => _selectOption("b"),
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 2.w),
                borderRadius: BorderRadius.circular(10.w)),
            child: Text(
              "b) Patent",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.aeonik.name),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () => _selectOption("c"),
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 2.w),
                borderRadius: BorderRadius.circular(10.w)),
            child: Text(
              "c) Trademark",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.aeonik.name),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () => _selectOption("d"),
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 2.w),
                borderRadius: BorderRadius.circular(10.w)),
            child: Text(
              "d) Design right",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.aeonik.name),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        CurrentQuestionPoint(),
        SizedBox(
          height: 20.h,
        ),
        if (showAnswer)
          Text(
            "${answerText}",
            style: TextStyle(fontSize: 14.sp, color: answerColor),
          )
      ],
    );
  }
}
