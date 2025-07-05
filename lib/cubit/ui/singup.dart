import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocListener, BlocBuilder, ReadContext;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/cubit/auth.stat.dart';
import 'package:paint_shop/cubit/login.dart';
import 'package:paint_shop/utils/app_text_filed.dart';

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
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
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
    _passwordController.dispose();
    _conPasswordController.dispose();
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
                      AppText(
                        fontWeight: FontWeight.w500,
                        title: AppString.signUp,
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),

                      AppText(
                        fontWeight: FontWeight.w500,
                        title: AppString.createYourAccount,
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
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
                              fontWeight: FontWeight.w500,
                            ),
                            AppTextField(
                              hintText: AppString.enterYourFullName,
                              controller: _nameController,
                              validator: MultiValidator([
                                RequiredValidator(
                                  errorText: "Name is Required",
                                ),
                              ]),
                            ),
                            Gap(13.h),
                            AppText(
                              fontWeight: FontWeight.w500,
                              title: AppString.emailAddress,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            AppTextField(
                              keyBoardType: TextInputType.emailAddress,
                              validator: MultiValidator([
                                EmailValidator(
                                  errorText: "Enter a valid email",
                                ),
                              ]),
                              hintText: AppString.Enteryouremail,
                              controller: _emailController,
                            ),
                            Gap(13.h),
                            AppText(
                              fontWeight: FontWeight.w500,
                              title: AppString.mobileNumber,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            AppTextField(
                              keyBoardType: TextInputType.phone,
                              validator: MultiValidator([
                                PatternValidator(
                                  r'^[0-9]{10}$',
                                  errorText: 'Enter a valid 10‑digit mobile',
                                ),
                              ]),
                              hintText: AppString.Enteryourmobilenumber,
                              controller: _mobileController,
                            ),
                            Gap(13.h),
                            AppText(
                              fontWeight: FontWeight.w500,
                              title: AppString.createPassword,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            AppTextField(
                              obscureText: true,
                              maxLines: 1,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Required'),
                                MinLengthValidator(
                                  8,
                                  errorText: 'Min 8 characters',
                                ),
                              ]),
                              hintText: AppString.enterYourPassword,
                              controller: _passwordController,
                            ),
                            Gap(13.h),
                            AppText(
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
                      Gap(40.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return AppButton(
                            color: AppColors.textLightColor,
                            onPressed: _trySingup,

                            title: AppString.signUp,
                          );
                        },
                      ),

                      Gap(13.h),
                      Align(
                        alignment: Alignment.center,
                        child: AppText(
                          textAlign: TextAlign.center,

                          title: AppString.alreadyHaveAnAccount,
                          color: Colors.black,
                          fontSize: 16.sp,
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
