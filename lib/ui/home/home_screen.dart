import 'package:flutter/material.dart';
import 'package:gamified_ip_rights/ui/home/widgets/_bottom_nav_bar.dart';

import 'package:gamified_ip_rights/ui/home/widgets/_home_sections.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeSections(), bottomNavigationBar: BottomNavBar());
  }
}
