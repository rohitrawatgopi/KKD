import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/core/services/image_picker_service.dart';
import 'package:paint_shop/features/3bottom/qr/cubit/qr.cubit.dart';
import 'package:paint_shop/features/3bottom/qr/cubit/qr.state.dart';
import 'package:paint_shop/utils/rewar_success_dilo.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  late final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    detectionTimeoutMs: 1000,
    autoStart: true,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScannerCubit, ScannerState>(
      listener: (ctx, state) async {
        if (state is ScannerFailure) {
          showDialog(
            context: ctx,
            barrierDismissible: false,
            builder: (context) => Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),

              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: QrScarrenWidget.succesCoinAlertDilogBox(
                context: context,
                conin: "332",
              ),
            ),
          );
        } else if (state is ScannerSuccess) {}
      },

      child: Scaffold(
        body: Stack(
          children: [
            MobileScanner(
              controller: _controller,
              fit: BoxFit.cover,
              onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;

                if (barcodes.isNotEmpty) {
                  final String? raw = barcodes.first.rawValue;

                  if (raw != null) {
                    try {
                      final Map<String, dynamic> decoded = jsonDecode(raw);
                      final payload = {
                        "productId": decoded["productId"],
                        "type": decoded["type"],
                        "timestamp": decoded["timestamp"],
                        "hash": decoded["hash"],
                      };

                      print(payload);
                      context.read<ScannerCubit>().QrScan(value: payload);

                      // Scanner band karna ho to:
                      // Navigator.pop(context);
                    } catch (e) {
                      print("Invalid QR JSON: $e");
                    }
                  }
                }
              },
              useAppLifecycleState: true,
            ),
            Positioned(bottom: 160, left: 55, child: _buildCornerBorders()),
            BlocBuilder<ScannerCubit, ScannerState>(
              builder: (context, state) {
                if (state is ScannerLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
              bottom: 120,
              left: 160,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      ReusableFilePicker.pickFile();
                    },
                    child: SvgPicture.asset(
                      AppImage.gallery,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  Gap(5.w),
                  SvgPicture.asset(
                    AppImage.flashLight,
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCornerBorders() {
    return Center(
      child: CustomPaint(
        size: const Size(250, 250),
        painter: CornerBorderPainter(),
      ),
    );
  }
}

class CornerBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const double length = 40;
    canvas.drawLine(const Offset(0, 0), const Offset(length, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, length), paint);
    canvas.drawLine(
      Offset(size.width - length, 0),
      Offset(size.width, 0),
      paint,
    );
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, length), paint);
    canvas.drawLine(const Offset(0, 250), const Offset(length, 250), paint);
    canvas.drawLine(const Offset(0, 250), const Offset(0, 250 - length), paint);
    canvas.drawLine(
      Offset(size.width - length, 250),
      Offset(size.width, 250),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 250),
      Offset(size.width, 250 - length),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
