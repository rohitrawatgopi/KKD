import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/utils/bottom_icon.dart';
import 'package:paint_shop/utils/uploaddoc.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    // HomeScreen(),
    UploadDocumnetScreen(UploadScreenName: ""),
    WithdrawScreen(),
    ProfileScreen(),
    ProductScreen(),

    // WithdrawScreen(),
    // ProfileScreen(),
    Text("1"), Text("1"),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: true,
        statusBarColor: Colors.transparent,
      ),

      child: Scaffold(
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
