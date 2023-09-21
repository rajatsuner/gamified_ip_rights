// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

final bottomNavIndexProvider = StateProvider((ref) => 0);

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  _onTap(int index, WidgetRef ref) {
    ref.read(bottomNavIndexProvider.notifier).update((state) => index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(bottomNavIndexProvider);
    print("REBUILD BOTTOM APP BAR");
    return BottomAppBar(
      // color: AppColors.blueGray,
      color: Colors.white,
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      notchMargin: 0,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarItem(
              label: "Explore",
              index: 0,
              currentIndex: currentIndex,
              selectIcon: Icons.explore,
              unselectIcon: Icons.explore_outlined,
              onTap: () => _onTap(0, ref)),
          NavBarItem(
              label: "More",
              index: 1,
              currentIndex: currentIndex,
              selectIcon: Icons.book,
              unselectIcon: Icons.book_outlined,
              onTap: () => _onTap(1, ref)),
          NavBarItem(
              label: "Leaderboard",
              index: 2,
              currentIndex: currentIndex,
              selectIcon: Icons.emoji_events,
              unselectIcon: Icons.emoji_events_outlined,
              onTap: () => _onTap(2, ref)),
          NavBarItem(
              label: "Community",
              index: 3,
              currentIndex: currentIndex,
              selectIcon: Icons.diversity_2_outlined,
              unselectIcon: Icons.diversity_2,
              onTap: () => _onTap(3, ref)),
          NavBarItem(
              label: "Profile",
              index: 4,
              currentIndex: currentIndex,
              selectIcon: Icons.person,
              unselectIcon: Icons.person_outlined,
              onTap: () => _onTap(4, ref)),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String label;
  final IconData selectIcon;
  final IconData unselectIcon;
  final VoidCallback onTap;
  final int index;
  final int currentIndex;
  const NavBarItem({
    Key? key,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.selectIcon,
    required this.unselectIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            currentIndex == index ? selectIcon : unselectIcon,
            color: currentIndex == index ? AppColors.blueGray : AppColors.grey,
          ),
          Text(
            label,
            style: TextStyle(
                letterSpacing: 0,
                color:
                    currentIndex == index ? AppColors.blueGray : AppColors.grey,
                fontSize: 10,
                fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}
