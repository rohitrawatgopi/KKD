import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:paint_shop/app/import.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // QR Scanner camera view
          MobileScanner(
            controller: MobileScannerController(),
            onDetect: (capture) {
              final barcode = capture.barcodes.first;
              debugPrint('Barcode found: ${barcode.rawValue}');
            },
          ),

          // Overlay

          // // Corner design (optional)
          // _buildCornerBorders(),
        ],
      ),
    );
  }

  Widget _buildCornerBorders() {
    return Center(
      child: Column(
        children: [
          Gap(200.h),

          SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(width: 40, height: 4, color: Colors.white),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(width: 4, height: 40, color: Colors.white),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(width: 40, height: 4, color: Colors.white),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(width: 4, height: 40, color: Colors.white),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(width: 40, height: 4, color: Colors.white),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(width: 4, height: 40, color: Colors.white),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(width: 40, height: 4, color: Colors.white),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(width: 4, height: 40, color: Colors.white),
                ),
              ],
            ),
          ),
          Gap(22.h),
          Container(
            height: 24.h,
            width: 70.w,

            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/flashlight.svg",
                  color: Colors.white,
                ),
                SvgPicture.asset(AppImage.gallery, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
