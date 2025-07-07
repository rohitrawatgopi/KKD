// // import 'package:flutter/material.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';

// // class QRScannerScreen extends StatefulWidget {
// //   const QRScannerScreen({super.key});

// //   @override
// //   State<QRScannerScreen> createState() => _QRScannerScreenState();
// // }

// // class _QRScannerScreenState extends State<QRScannerScreen> {
// //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

// //   QRViewController? controller;

// //   String? scannedData;

// //   @override
// //   void reassemble() {
// //     super.reassemble();
// //     if (controller != null)\\\\\\\\\\\\\
// //       controller!.pauseCamera();
// //       controller!.resumeCamera();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Scan QR Code")),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             flex: 4,
// //             child: QRView(
// //               key: qrKey,
// //               onQRViewCreated: _onQRViewCreated,
// //               overlay: QrScannerOverlayShape(
// //                 borderColor: Colors.red,
// //                 borderRadius: 10,
// //                 borderLength: 30,
// //                 borderWidth: 10,
// //                 cutOutSize: 250,
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             flex: 1,
// //             child: Center(
// //               child: Text(
// //                 scannedData != null
// //                     ? "Scanned: $scannedData"
// //                     : "Scan a QR code",
// //                 style: const TextStyle(fontSize: 16),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _onQRViewCreated(QRViewController controller) {
// //     this.controller = controller;
// //     controller.scannedDataStream.listen((scanData) {
// //       setState(() {
// //         scannedData = scanData.code;
// //       });
// //       controller.pauseCamera(); // stop after one scan
// //     });
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class ScanQrScreen extends StatefulWidget {
//   const ScanQrScreen({Key? key}) : super(key: key);
//   @override
//   State<ScanQrScreen> createState() => _ScanQrScreenState();
// }

// class _ScanQrScreenState extends State<ScanQrScreen> {
//   final controller = MobileScannerController(
//     formats: [BarcodeFormat.qrCode],
//     torchEnabled: false,
//   );
//   String? scanned;

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Future<void> _scanFromGallery() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       final capture = await controller.analyzeImage(
//         picked.path,
//         formats: [BarcodeFormat.qrCode],
//       );
//       final barcodes = capture!.barcodes;
//       if (barcodes != null) {
//         for (final b in barcodes) {
//           if (b.format == BarcodeFormat.qrCode && b.rawValue != null) {
//             Navigator.pop(context, b.rawValue!);
//             return;
//           }
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Expanded(
//             child: MobileScanner(
//               controller: controller,
//               onDetect: (capture) {
//                 final barcodes = capture.barcodes;
//                 if (barcodes != null) {
//                   for (final b in barcodes) {
//                     if (b.format == BarcodeFormat.qrCode &&
//                         b.rawValue != null) {
//                       final code = b.rawValue!;
//                       if (code != scanned) {
//                         scanned = code;
//                         controller.stop();
//                         Navigator.pop(context, code);
//                       }
//                       break;
//                     }
//                   }
//                 }
//               },
//             ),
//           ),
//           Row(
//             children: [
//               IconButton(
//                 icon: ValueListenableBuilder<MobileScannerState>(
//                   valueListenable: controller,
//                   builder: (_, state, __) {
//                     final ts = state.torchState;
//                     if (ts == TorchState.on)
//                       return const Icon(Icons.flash_on, color: Colors.white);
//                     if (ts == TorchState.off)
//                       return const Icon(Icons.flash_off, color: Colors.white);
//                     return const Icon(Icons.flash_off, color: Colors.white);
//                   },
//                 ),
//                 onPressed: () => controller.toggleTorch(),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.photo, color: Colors.white),
//                 onPressed: _scanFromGallery,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:paint_shop/app/import.dart';

// class QRScannerScreen extends StatefulWidget {
//   const QRScannerScreen({super.key});
//   @override
//   State<QRScannerScreen> createState() => _QRScannerScreenState();
// }

// class _QRScannerScreenState extends State<QRScannerScreen> {
//   final MobileScannerController controller = MobileScannerController();
//   final ImagePicker picker = ImagePicker();
//   bool torchOn = false;

//   Future<void> pickFromGallery() async {
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       controller.analyzeImage(image.path);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           MobileScanner(
//             controller: controller,
//             onDetect: (capture) {
//               final code = capture.barcodes.first.rawValue;
//               if (code != null) {
//                 ScaffoldMessenger.of(
//                   context,
//                 ).showSnackBar(SnackBar(content: Text(code)));
//               }
//             },
//           ),
//           const ScannerOverlay(),
//           Positioned(
//             bottom: 40,
//             left: 40,
//             child: IconButton(
//               icon: Icon(
//                 torchOn ? Icons.flash_on : Icons.flash_off,
//                 color: Colors.white,
//                 size: 32,
//               ),
//               onPressed: () {
//                 controller.toggleTorch();
//                 setState(() => torchOn = !torchOn);
//               },
//             ),
//           ),
//           Positioned(
//             bottom: 40,
//             right: 40,
//             child: IconButton(
//               icon: const Icon(Icons.photo, color: Colors.white, size: 32),
//               onPressed: pickFromGallery,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// class ScannerOverlay extends StatelessWidget {
//   const ScannerOverlay({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (_, bc) {
//         final w = bc.maxWidth, h = bc.maxHeight;
//         final size = w * 0.7, left = (w - size) / 2, top = (h - size) / 2;
//         return CustomPaint(
//           size: Size(w, h),
//           painter: _OverlayPainter(
//             holeRect: Rect.fromLTWH(left, top, size, size),
//             borderRadius: 16,
//             borderColor: Colors.white,
//             borderWidth: 4,
//             overlayColor: Colors.black.withOpacity(0.5),
//           ),
//         );
//       },
//     );
//   }
// }

// class _OverlayPainter extends CustomPainter {
//   final Rect holeRect;
//   final double borderRadius, borderWidth;
//   final Color borderColor, overlayColor;
//   _OverlayPainter({
//     required this.holeRect,
//     required this.borderRadius,
//     required this.borderColor,
//     required this.borderWidth,
//     required this.overlayColor,
//   });
//   @override
//   void paint(Canvas c, Size s) {
//     final paint = Paint()..color = overlayColor;
//     final bg = Path()..addRect(Rect.fromLTWH(0, 0, s.width, s.height));
//     final hole = Path()
//       ..addRRect(
//         RRect.fromRectAndRadius(holeRect, Radius.circular(borderRadius)),
//       )
//       ..close();
//     c.drawPath(Path.combine(PathOperation.difference, bg, hole), paint);

//     c.drawRRect(
//       RRect.fromRectAndRadius(holeRect, Radius.circular(borderRadius)),
//       Paint()
//         ..color = borderColor
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = borderWidth,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter old) => false;
// }
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:torch_light/torch_light.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QRScannerScreen extends StatefulWidget {
//   @override
//   _QRScannerScreenState createState() => _QRScannerScreenState();
// }

// class _QRScannerScreenState extends State<QRScannerScreen> {
//   bool _isFlashOn = false;
//   String? _scannedCode;
//   String? _pickedImageName;

//   Future<void> _toggleFlashlight() async {
//     try {
//       if (_isFlashOn) {
//         await TorchLight.disableTorch();
//       } else {
//         await TorchLight.enableTorch();
//       }
//       setState(() {
//         _isFlashOn = !_isFlashOn;
//       });
//     } catch (e) {
//       print('Flashlight error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Flashlight not available')),
//       );
//     }
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _pickedImageName = pickedFile.name;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Picked image: ${pickedFile.name}')),
//       );
//     } else {
//       print('No image selected.');
//     }
//   }

//   void _onQRDetected(String code) {
//     if (_scannedCode != code) {
//       setState(() {
//         _scannedCode = code;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Scanned QR: $code')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('QR + Flash + Image Picker'),
//         backgroundColor: Colors.black,
//       ),
//       body: Column(
//         children: [
//           // QR Scanner View
//           Expanded(
//             flex: 4,
//             child: MobileScanner(
//             //   allowDuplicates: false,
//             //   onDetect: (barcode, args) {
//             //     final code = barcode.rawValue;
//             //     if (code != null) _onQRDetected(code);
//             //   },
//             // ),
//           ),),

//           // Info Display
//           Expanded(
//             flex: 2,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   _scannedCode != null ? 'QR: $_scannedCode' : 'Scan a QR code',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   _pickedImageName != null ? 'Image: $_pickedImageName' : 'No image selected',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         _isFlashOn ? Icons.flash_off : Icons.flash_on,
//                         color: Colors.white,
//                       ),
//                       onPressed: _toggleFlashlight,
//                     ),
//                     SizedBox(width: 30),
//                     IconButton(
//                       icon: Icon(Icons.image, color: Colors.white),
//                       onPressed: _pickImage,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: QRScannerScreen()),
  );
}

class QRScannerScreen extends StatefulWidget {
  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final MobileScannerController _controller = MobileScannerController();
  bool _isFlashOn = false;
  String? _scannedCode;
  String? _pickedImageName;

  Future<void> _toggleFlashlight() async {
    try {
      if (_isFlashOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Flashlight not available: $e')));
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImageName = pickedFile.name;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Picked image: ${pickedFile.name}')),
      );
    }
  }

  void _onQRDetected(String code) {
    if (_scannedCode != code) {
      setState(() {
        _scannedCode = code;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Scanned QR: $code')));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('QR Scanner'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(_isFlashOn ? Icons.flash_off : Icons.flash_on),
            onPressed: _toggleFlashlight,
          ),
          IconButton(icon: Icon(Icons.image), onPressed: _pickImage),
        ],
      ),
      body: Column(
        children: [
          Expanded(flex: 4, child: MobileScanner(controller: _controller)),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _scannedCode != null
                        ? 'QR: $_scannedCode'
                        : 'Scan a QR code',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _pickedImageName != null
                        ? 'Image: $_pickedImageName'
                        : 'No image selected',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
