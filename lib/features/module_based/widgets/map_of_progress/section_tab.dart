import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/map_of_progress/section_map.dart';

class SectionTab extends StatelessWidget {
  int sectionNumber;
  String sectionName;
  double progress;

  SectionTab({
    Key? key,
    required this.sectionNumber,
    required this.sectionName,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, AppRoute.activityRoom.path);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.blueGray, width: 3.w)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Section $sectionNumber",
                        style: TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Aeonik',
                            fontSize: 16.sp),
                      ),
                      Text(
                        "$sectionName",
                        style: TextStyle(
                            color: AppColors.deepBlue,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.purple, width: 5)),
                    child: Text(
                      "${progress.toInt()}%",
                      style: TextStyle(
                          color: AppColors.violet,
                          fontFamily: 'Aeonik',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SectionMapOfProgress(sectionNum: sectionNumber)
      ],
    );
  }
}
