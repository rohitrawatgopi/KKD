import 'package:hive_flutter/adapters.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/delte/user_model.dart';
import 'package:paint_shop/utils/animation_img.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double width = 0;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      final user = Hive.box<UserModel>('userBox').get('currentUser');
      if (user != null) {
        context.pushNamed("home");
      } else {
        context.pushNamed("login");
      }
      print(user);
    });

    super.initState();
  }

  void checkUser() async {}

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.appColor,
                    AppColors.appColor,
                    AppColors.appWhite,
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 101),
                  child: MyAnimatedImage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
