import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/home/ui/home.dart';
import 'package:paint_shop/features/3bottom/qr/ui/qr.dart';
import 'package:paint_shop/features/3bottom/withdraw/ui/Withdraw.dart';
import 'package:paint_shop/utils/bottom_icon.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 0;

  static List<Widget> _pages = [
    HomeScreen(),

    ProductScreen(),
    QRScannerScreen(),

    WithdrawScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: true,
        statusBarColor: Colors.transparent,
      ),

      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          height: 70,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavIcon(
                asset: AppImage.homeIcon,
                label: AppString.home,
                isActive: _currentIndex == 0,
                onTap: () => setState(() => _currentIndex = 0),
              ),
              NavIcon(
                asset: AppImage.productIcon,
                label: AppString.product,
                isActive: _currentIndex == 1,
                onTap: () => setState(() => _currentIndex = 1),
              ),
              NavIcon(
                asset: AppImage.qrIcon,
                label: AppString.qrScan,
                isActive: _currentIndex == 2,
                onTap: () => setState(() => _currentIndex = 2),
              ),
              NavIcon(
                asset: AppImage.withdrawIcon,
                label: AppString.withdraw,
                isActive: _currentIndex == 3,
                onTap: () => setState(() => _currentIndex = 3),
              ),
              NavIcon(
                asset: AppImage.profileIcon,
                label: AppString.Profile,
                isActive: _currentIndex == 4,
                onTap: () => setState(() => _currentIndex = 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
