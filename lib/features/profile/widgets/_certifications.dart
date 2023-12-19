import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/core/styles/styles.dart';

class CertificationsList extends StatelessWidget {
  CertificationsList({super.key});

  List<Map<String, String>> certifications = [
    {"title": "Patents", "progress": "0"},
    {"title": "Trademark", "progress": "0"},
    {"title": "Copyright", "progress": "0"},
    {"title": "Design", "progress": "0"}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Certificates", style: AppStyles.profileTags),
        SizedBox(
          height: 15.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.w)),
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    indent: 20.w,
                    endIndent: 20.w,
                    color: AppColors.purple.withOpacity(0.3),
                  ),
              shrinkWrap: true,
              itemCount: certifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.badge_sharp,
                    size: 40.w,
                    color: AppColors.blueGray.withOpacity(0.8),
                  ),
                  title: Text(
                    "${certifications[index]['title']}",
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: 'Aeonik',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  trailing: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.deepBlue.withOpacity(0.8),
                              width: 3.w)),
                      child: Text(
                        "${certifications[index]['progress']}%",
                        style: TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Aeonik',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      )),
                );
              }),
        )
      ],
    );
  }
}
