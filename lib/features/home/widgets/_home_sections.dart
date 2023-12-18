import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/features/home/widgets/_bottom_nav_bar.dart';
import 'package:gamified_ip_rights/features/leaderboard/screen/leaderboard_screen.dart';
import 'package:gamified_ip_rights/features/module_based/screen/map_of_progress_screen.dart';

class HomeSections extends ConsumerWidget {
  HomeSections({super.key});

  List<Widget> sectionsList = [
    const MapOfProgressScreen(),
    Container(color: Colors.green),
    const LeaderboardScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("REBUILD HOME SECTIONS");
    int index = ref.watch(bottomNavIndexProvider);
    return sectionsList[index];
  }
}
