import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_icons.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/auth/controller/auth_controller.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Idea - Fi",
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Discover | Learn | Innovate |Share",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: GoogleSignInButton(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    try {
      ref.read(authControllerProvider.notifier).signInWithGoogle(context);
    } on Exception catch (e) {}
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return isLoading
        ? AuthLoader()
        : ElevatedButton.icon(
            onPressed: () => signInWithGoogle(context, ref),
            icon: Image.asset(
              AppIcons.google.path,
              width: 35.w,
            ),
            label: Text(
              'Continue with Google',
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.circular(12.w),
              ),
            ),
          );
  }
}

class AuthLoader extends StatelessWidget {
  const AuthLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: AppColors.violet,
    ));
  }
}
