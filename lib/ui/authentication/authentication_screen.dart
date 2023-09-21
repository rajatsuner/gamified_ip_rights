import 'package:flutter/material.dart';
import 'package:gamified_ip_rights/global/router.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueGray,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoute.home.path);
            },
            child: Text("Google Sign In")),
      ),
    );
  }
}
