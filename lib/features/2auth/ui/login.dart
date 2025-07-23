import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paint_shop/core/constants/color_constant.dart';
import 'package:paint_shop/core/constants/text_constant.dart';
import 'package:paint_shop/features/2auth/cubit/auth.cubit.dart';
import 'package:paint_shop/features/2auth/cubit/auth.state.dart';
import 'package:paint_shop/features/2auth/widget/login.head.dart';
import 'package:paint_shop/utils/app_button.dart';
import 'package:paint_shop/utils/app_text.dart';
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:paint_shop/utils/toast_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailMobileController = TextEditingController();
  final _passwordController = TextEditingController();

  void _tryLogin() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(
        _emailMobileController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    _emailMobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.blueLightColor),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [Colors.white, AppColors.appColor],
              ),
            ),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  AppToast.error(state.message);
                } else if (state is AuthSuccess) {
                  AppToast.success(state.message!);
                  context.push("/home");
                }
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLoginHeaad(),
                      Container(
                        padding: EdgeInsets.only(left: 24.w, right: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(20),
                            InkWell(
                              onTap: () {
                                print(Hive.box('authBox').get('token'));
                              },
                              child: AppText(
                                fontWeight: FontWeight.w500,
                                title: AppString.emailOrMobile,
                                color: Colors.black,
                                fontSize: 16.sp,
                                height: 1.5,
                              ),
                            ),
                            AppTextField(
                              controller: _emailMobileController,
                              hintText: AppString.enterYourEmailOrMobile,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email or mobile number is required';
                                }

                                final emailRegex = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );
                                final phoneRegex = RegExp(r'^[0-9]{10}$');

                                if (!emailRegex.hasMatch(value.trim()) &&
                                    !phoneRegex.hasMatch(value.trim())) {
                                  return 'Enter a valid email or 10-digit mobile number';
                                }

                                return null;
                              },
                            ),

                            Gap(13),
                            AppText(
                              title: AppString.password,
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            ),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                final cubit = context.read<AuthCubit>();

                                return AppTextField(
                                  height: 50.h,
                                  maxLines: 1,
                                  validator: RequiredValidator(
                                    errorText: "Password is required' ",
                                  ),
                                  controller: _passwordController,
                                  hintText: 'Enter your password',
                                  obscureText: cubit.isSSecure,
                                  surfixIcon: IconButton(
                                    icon: Icon(
                                      cubit.isSSecure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      cubit.toggleSecure();
                                    },
                                  ),
                                );
                              },
                            ),
                            Gap(350.h),

                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return AppButton(
                                  color: AppColors.textLightColor,
                                  onPressed: _tryLogin,
                                  title: AppString.Login,
                                );
                              },
                            ),

                            Gap(13.h),
                            InkWell(
                              onTap: () {
                                context.go("/signup");
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: AppText(
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                  title: AppString.Donthaveanaccount,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
