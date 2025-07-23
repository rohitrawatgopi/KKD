import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocListener, BlocBuilder, ReadContext;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/2auth/cubit/auth.cubit.dart';
import 'package:paint_shop/features/2auth/cubit/auth.state.dart';
import 'package:paint_shop/features/2auth/widget/signup.head.dart';
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:paint_shop/utils/toast_message.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  void _trySingup() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        fullName: _nameController.text.trim(),
        phone: _mobileController.text,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _conPasswordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.blueLightColor),

      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 72.h),
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

                  context.go('/login');
                }
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSingupHead(),
                      Gap(20.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: AppString.fullName,
                              color: Colors.black,
                              fontSize: 16.sp,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                            AppTextField(
                              textHeight: 1.4,
                              hintText: AppString.enterYourFullName,
                              controller: _nameController,
                              validator: MultiValidator([
                                RequiredValidator(
                                  errorText: "Name is Required",
                                ),
                              ]).call,
                            ),
                            Gap(13.h),
                            AppText(
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              title: AppString.emailAddress,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            AppTextField(
                              textHeight: 1.4,
                              keyBoardType: TextInputType.emailAddress,
                              validator: MultiValidator([
                                EmailValidator(
                                  errorText: "Enter a valid email",
                                ),
                              ]).call,
                              hintText: AppString.Enteryouremail,
                              controller: _emailController,
                            ),
                            Gap(13.h),
                            AppText(
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              title: AppString.mobileNumber,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            AppTextField(
                              textHeight: 1.4,
                              keyBoardType: TextInputType.phone,
                              validator: MultiValidator([
                                PatternValidator(
                                  r'^[0-9]{10}$',
                                  errorText: 'Enter a valid 10‑digit mobile',
                                ),
                              ]).call,
                              hintText: AppString.Enteryourmobilenumber,
                              controller: _mobileController,
                            ),
                            Gap(13.h),
                            AppText(
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              title: AppString.createPassword,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            AppTextField(
                              textHeight: 1.4,
                              obscureText: true,
                              maxLines: 1,

                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Required'),
                                MinLengthValidator(
                                  6,
                                  errorText: 'Min 6 characters',
                                ),
                              ]).call,
                              hintText: AppString.enterYourPassword,
                              controller: _passwordController,
                            ),
                            Gap(13.h),
                            AppText(
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              title: AppString.confirmedPassword,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            AppTextField(
                              maxLines: 1,
                              obscureText: true,
                              validator: (val) {
                                return MatchValidator(
                                  errorText: 'Passwords do not match',
                                ).validateMatch(
                                  val ?? '',
                                  _passwordController.text.toString(),
                                );
                              },
                              hintText: AppString.enterYourPassword,
                              controller: _conPasswordController,
                            ),
                          ],
                        ),
                      ),
                      Gap(100.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return AppButton(
                            fontHeight: 1.4,
                            color: AppColors.textLightColor,
                            onPressed: _trySingup,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,

                            title: AppString.signUp,
                          );
                        },
                      ),

                      Gap(13.h),
                      InkWell(
                        onTap: () {
                          context.go("/login");
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: AppText(
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            title: AppString.alreadyHaveAnAccount,
                            color: Colors.black,
                            fontSize: 14.sp,
                            height: 1.2,
                          ),
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
