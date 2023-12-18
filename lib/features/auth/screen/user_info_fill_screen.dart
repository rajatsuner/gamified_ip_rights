import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_font.dart';
import 'package:gamified_ip_rights/core/assets/_icons.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/auth/controller/auth_controller.dart';
import 'package:gamified_ip_rights/features/auth/model/user_model.dart';
import 'package:gamified_ip_rights/features/auth/screen/auth_screen.dart';

class UserInfoFillScreen extends ConsumerStatefulWidget {
  const UserInfoFillScreen({super.key});

  @override
  ConsumerState<UserInfoFillScreen> createState() => _UserInfoFillScreenState();
}

class _UserInfoFillScreenState extends ConsumerState<UserInfoFillScreen> {
  late TextEditingController _emailController,
      _ageController,
      _diceCodeController,
      _nameController;

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _ageController = TextEditingController();
    _diceCodeController = TextEditingController();
    _nameController = TextEditingController();
    _emailController =
        TextEditingController(text: ref.read(userModelProvider)!.email);
  }

  @override
  void dispose() {
    _ageController.dispose();
    _nameController.dispose();
    _diceCodeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  _registerUser() {
    _formKey.currentState!.save();
    bool isValid = _formKey.currentState!.validate();

    print(isValid);
    if (isValid) {
      ref.read(userModelProvider.notifier).update((state) => state!.copyWith(
          diceCode: '0',
          age: int.parse(_ageController.text.trim()),
          userName: _nameController.text.trim()));

      ref.read(authControllerProvider.notifier).registerUser(context);
    }

    // ref.read(userModelProvider.notifier).update((state) =>
    //     state!.copyWith(diceCode: '36000', age: 20, userName: 'Rajat Suner'));

    // ref.read(authControllerProvider.notifier).registerUser(context);
  }

  String? _validateName() {
    String name = _nameController.text;
    if (name.trim().length == 0) {
      return "Name cannot be empty";
    }
  }

  String? _validateAge() {
    if (_ageController.text.trim().length == 0) {
      return "Age cannot be empty";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppIcons.logo.path,
              height: 120.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email ID",
                      style: TextStyle(
                          fontFamily: AppFonts.aeonik.name, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      enabled: false,
                      controller: _emailController,
                      readOnly: true,
                      style: TextStyle(color: AppColors.blueGray),
                      textInputAction: TextInputAction.next,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          filled: true,
                          fillColor: AppColors.grey.withOpacity(0.3),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(color: AppColors.blueGray),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray))),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontFamily: AppFonts.aeonik.name, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) => _validateName(),
                      style: TextStyle(color: AppColors.blueGray),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.abc),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          hintText: "Enter your name",
                          hintStyle: TextStyle(color: AppColors.blueGray),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray))),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                          fontFamily: AppFonts.aeonik.name, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: _ageController,
                      validator: (value) => _validateAge(),
                      style: TextStyle(color: AppColors.blueGray),
                      textInputAction: TextInputAction.done,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.numbers),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          hintText: "Enter your age",
                          hintStyle: TextStyle(color: AppColors.blueGray),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blueGray))),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    isLoading
                        ? const AuthLoader()
                        : InkWell(
                            borderRadius: BorderRadius.circular(10.w),
                            onTap: () => _registerUser(),
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.blueGray,
                                  boxShadow: [
                                    const BoxShadow(
                                        offset: Offset(
                                          1,
                                          1,
                                        ),
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ],
                                  borderRadius: BorderRadius.circular(10.w)),
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontFamily: AppFonts.aeonik.name,
                                    fontSize: 18.sp),
                              ),
                            ),
                          )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
