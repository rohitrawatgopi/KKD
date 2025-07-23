import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/app/router.dart';
import 'package:paint_shop/features/2auth/cubit/auth.cubit.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.cubit.dart';
import 'package:paint_shop/features/3bottom/product/cubit/product.cubit.dart';
import 'package:paint_shop/features/3bottom/product/widget/category/cubit/category.product.cubit.dart';
import 'package:paint_shop/features/3bottom/product/widget/offer/cubit/category.product.cubit.dart';
import 'package:paint_shop/features/3bottom/product/widget/search/cubit/search.product.cubit.dart';
import 'package:paint_shop/features/3bottom/profile/cubit/profile.cubit.dart';
import 'package:paint_shop/features/3bottom/qr/cubit/qr.cubit.dart';
import 'package:paint_shop/features/3bottom/withdraw/cubit/withdraw.cubit.dart';
import 'package:paint_shop/features/network.check/cubit/network.state.dart';
import 'package:paint_shop/features/network.check/cubit/networrk.cubit.dart';
import 'package:paint_shop/utils/toast_message.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  // debugPaintSizeEnabled = true;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => WithDrawCubit()),
        BlocProvider(create: (_) => NetworkCubit()),
        BlocProvider(create: (_) => ScannerCubit()),
        BlocProvider(create: (_) => ProductCategoryCubit()),
        BlocProvider(create: (_) => ProductOfferCubit()),
        BlocProvider(create: (_) => ProductSearchCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: ThemeData(fontFamily: 'SF Pro'),
          builder: (context, child) {
            return BlocListener<NetworkCubit, NetworkState>(
              listener: (context, state) {
                if (state is NetworkDisconnected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(days: 2),

                      content: AppText(
                        title: "You Lost Your Internet Connetion",
                      ),
                      action: SnackBarAction(
                        label: "retry",
                        onPressed: () {
                          context.read<NetworkCubit>().checkConnection();
                        },
                      ),
                    ),
                  );
                }
                if (state is NetworkConnected) {
                  AppToast.success("Connected");
                }
              },
              child: child,
            );
          },
        );
      },
    );
  }
}

// class HomeScreen3 extends StatefulWidget {
//   const HomeScreen3({super.key});

//   @override
//   State<HomeScreen3> createState() => _HomeScreen3State();
// }

// class _HomeScreen3State extends State<HomeScreen3> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Center(child: AppText(title: "jbdajsba")),
//       ),
//     );
//   }
// }
