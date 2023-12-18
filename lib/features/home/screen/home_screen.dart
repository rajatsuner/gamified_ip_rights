import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/home/widgets/_bottom_nav_bar.dart';
import 'package:gamified_ip_rights/features/home/widgets/_home_sections.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: HomeSections(), bottomNavigationBar: const BottomNavBar());
  }
}
