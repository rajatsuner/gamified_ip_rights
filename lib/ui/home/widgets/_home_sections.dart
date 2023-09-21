import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/ui/community/community_section.dart';
import 'package:gamified_ip_rights/ui/explore/explore_section.dart';
import 'package:gamified_ip_rights/ui/home/widgets/_bottom_nav_bar.dart';
import 'package:gamified_ip_rights/ui/leaderboard/leaderboard_section.dart';
import 'package:gamified_ip_rights/ui/more_stuff/more_stuff_section.dart';
import 'package:gamified_ip_rights/ui/profile/profile_section.dart';

class HomeSections extends ConsumerWidget {
  const HomeSections({super.key});
  static List<Widget> sectionsList = [
    const ExploreSection(),
    const MoreStuffSection(),
    const LeaderboardSection(),
    const CommunitySection(),
    const ProfileSection()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("REBUILD HOME SECTIONS");
    int index = ref.watch(bottomNavIndexProvider);
    return sectionsList[index];
  }
}
