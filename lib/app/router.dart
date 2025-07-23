import 'package:paint_shop/app/bottom.dart' show BottomNavigationBarScreen;
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/core/model/user.model.dart';
import 'package:paint_shop/features/3bottom/home/ui/home.dart';
import 'package:paint_shop/features/3bottom/product/widget/category/ui/product.category.dart';
import 'package:paint_shop/features/3bottom/product/widget/details.screen.dart'
    show RewardDetailsScreen;
import 'package:paint_shop/features/3bottom/product/widget/offer/ui/offer.dart';
import 'package:paint_shop/features/3bottom/product/widget/search/ui/search.product.dart';
import 'package:paint_shop/features/3bottom/profile/ui/uploaddoc.dart';
import 'package:paint_shop/features/3bottom/profile/widget/bank.edit.dart';
import 'package:paint_shop/features/3bottom/profile/widget/profile.edit.dart'
    show UdateProfileScreen;
import 'package:paint_shop/features/3bottom/qr/ui/qr.dart';
import 'package:paint_shop/features/3bottom/withdraw/ui/Withdraw.dart';
import 'package:paint_shop/features/3bottom/withdraw/ui/history.dart'
    show WithDrawaHistory;

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNavigationBarScreen(child: child); // 👈 common layout
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
        GoRoute(
          path: '/product',

          builder: (context, state) {
            return ProductScreen();
          },
        ),
        GoRoute(
          path: '/search',

          builder: (context, state) {
            final search = state.extra as String;
            return searchProductScreen(screenName: search);
          },
        ),
        GoRoute(
          path: '/cactegoryProduct',

          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            final category = extra['category'] as String;
            final screenName = extra['screenName'] as String;
            return CategoryProductScreen(
              categoryId: category,
              categoryName: screenName,
            );
          },
        ),

        GoRoute(
          path: '/qr',
          builder: (context, state) => const QRScannerScreen(),
        ),
        GoRoute(path: '/offer', builder: (context, state) => OfferScreen()),
        GoRoute(
          path: '/withdraw',
          builder: (context, state) => WithdrawScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) {
            return ProfileScreen();
          },
        ),
        GoRoute(
          path: '/details',
          builder: (context, state) => const RewardDetailsScreen(),
        ),
        GoRoute(
          path: '/trasnactionhistory',
          builder: (context, state) => const WithDrawaHistory(),
        ),
        GoRoute(
          path: '/UploadDocumnetScreen',
          builder: (context, state) {
            final uploadScreenName = state.extra as String;
            return UploadDocumnetScreen(uploadScreenName: uploadScreenName);
          },
        ),
        GoRoute(
          path: '/UdateProfileScreen',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            final uploadScreenName = extra['screenName'] as String;
            final user = extra['user'] as UserModel;
            return UdateProfileScreen(
              updateScreenName: uploadScreenName,
              user: user,
            );
          },
        ),
        GoRoute(
          path: '/UdateBankScreen',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            final uploadScreenName = extra['screenName'] as String;
            final user = extra['user'] as UserModel;

            return UdateBankScreen(
              updateScreenName: uploadScreenName,
              user: user,
            );
          },
        ),
      ],
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(path: '/splash', builder: (context, state) => OnboardingScreen()),
  ],
);
