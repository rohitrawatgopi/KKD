import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:paint_shop/core/constants/color_constant.dart';
import 'package:paint_shop/core/constants/text_constant.dart';
import 'package:paint_shop/features/2auth/cubit/auth.cubit.dart';
import 'package:paint_shop/features/2auth/cubit/auth.state.dart';
import 'package:paint_shop/utils/app_button.dart';
import 'package:paint_shop/utils/app_text.dart';
import 'package:paint_shop/utils/app_text_filed.dart';

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
    if (_formKey.currentState!.validate()) {
      // ✅ सुधार: cubit को call करें
      context.read<AuthCubit>().signIn(
        _emailMobileController.text.trim(),
        _passwordController.text,
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
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is AuthSuccess) {
                  context.goNamed('home');
                }
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          top: 72.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              fontWeight: FontWeight.w500,
                              title: AppString.welcomeBack,
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                            AppText(
                              fontWeight: FontWeight.w500,
                              title: AppString.loginToContinue,
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 24.w, right: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(20),
                            AppText(
                              fontWeight: FontWeight.w500,
                              title: AppString.emailOrMobile,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            AppTextField(
                              controller: _emailMobileController,
                              hintText: AppString.enterYourEmailOrMobile,
                              validator: MultiValidator([
                                EmailValidator(
                                  errorText: 'Enter a valid email',
                                ),
                              ]),
                            ),
                            Gap(13),
                            AppText(
                              title: AppString.password,
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            AppTextField(
                              controller: _passwordController,
                              hintText: AppString.enterYourPassword,
                              obscureText: true,
                              maxLines: 1,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Required'),
                                MinLengthValidator(
                                  8,
                                  errorText: 'Min 8 characters',
                                ),
                              ]),
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
                                  onPressed:
                                      _tryLogin, // ✅ सुधार: अब login call हो रहा है
                                  title: AppString.Login,
                                );
                              },
                            ),

                            // AppButton(
                            //   color: AppColors.textLightColor,
                            //   onPressed:
                            //       _tryLogin, // ✅ सुधार: अब login call हो रहा है
                            //   title: AppString.Login,
                            // ),
                            Gap(13.h),
                            InkWell(
                              onTap: () {
                                context.pushNamed("signup");
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: AppText(
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  title: AppString.Donthaveanaccount,
                                  color: Colors.black,
                                  fontSize: 16.sp,
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
