import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/bottom/bottom.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/bottom',

  routes: [
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) => const RewardDetailsScreen(),
    ),

    // GoRoute(
    //   path: '/details',
    //   name: 'details',
    //   builder: (context, state) => MyAnimatedImage(),
    // ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/bottom',
      name: 'bottom',
      builder: (context, state) => const BottomNavigationBarScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/withdraw',
      name: 'withdraw',
      builder: (context, state) => const WithdrawScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   builder: (context, state) => const HomeScreen(),
    // ),
    GoRoute(
      path: '/product',
      name: 'product',
      builder: (context, state) => const ProductScreen(),
    ),
    // GoRoute(
    //   path: '/qr',
    //   name: 'qr',
    //   builder: (context, state) => const QRScannerScreen(),
    // ),
    // GoRoute(
    //   path: '/wallet',
    //   name: 'wallet',
    //   builder: (context, state) => const WalletScreen(),
    // ),

    // GoRoute(
    //   path: '/upload-passbook',
    //   name: 'uploadPassbook',
    //   builder: (context, state) => const UploadPassbookScreen(),
    // ),
    // GoRoute(
    //   path: '/complete-profile',
    //   name: 'completeProfile',
    //   builder: (context, state) => const CompletedProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/congratulations',
    //   name: 'congratulations',
    //   builder: (context, state) => const CongratulationsScreen(),
    // ),
  ],
);
