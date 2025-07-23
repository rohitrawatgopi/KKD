// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/app/import.dart'; // apna shared import file
import 'package:paint_shop/features/3bottom/product/cubit/product.cubit.dart';
import 'package:paint_shop/utils/bottom_icon.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  final Widget child;
  const BottomNavigationBarScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.toString();

    int _getIndex() {
      if (location.startsWith('/product')) return 1;
      if (location.startsWith('/qr')) return 2;
      if (location.startsWith('/withdraw')) return 3;
      if (location.startsWith('/profile')) return 4;
      return 0;
    }

    void _onTap(int index) {
      switch (index) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/product');
          break;
        case 2:
          context.go('/qr');
          break;
        case 3:
          context.go('/withdraw');
          break;
        case 4:
          context.go('/profile');
          break;
      }
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
      ),
      child: Scaffold(
        body: child,
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavIcon(
                asset: AppImage.homeIcon,
                label: AppString.home,
                isActive: _getIndex() == 0,
                onTap: () => _onTap(0),
              ),
              NavIcon(
                asset: AppImage.productIcon,
                label: AppString.product,
                isActive: _getIndex() == 1,
                onTap: () => _onTap(1),
              ),
              NavIcon(
                asset: AppImage.qrIcon,
                label: AppString.qrScan,
                isActive: _getIndex() == 2,
                onTap: () => _onTap(2),
              ),
              NavIcon(
                asset: AppImage.withdrawIcon,
                label: AppString.withdraw,
                isActive: _getIndex() == 3,
                onTap: () {
                  _onTap(3);
                  context.read<ProductCubit>().getPageWise();
                },
              ),
              NavIcon(
                asset: AppImage.profileIcon,
                label: AppString.Profile,
                isActive: _getIndex() == 4,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
