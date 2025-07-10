import 'package:paint_shop/app/import.dart';

class MyAnimatedImage extends StatefulWidget {
  @override
  State<MyAnimatedImage> createState() => _MyAnimatedImageState();
}

class _MyAnimatedImageState extends State<MyAnimatedImage> {
  double _width = 0;
  final double _height = 85.22;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _width = 150;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(),
      width: _width,

      height: _height,
      duration: const Duration(seconds: 1),
      child: Image.asset(
        AppImage.splashImg,

        fit: BoxFit.fitHeight,
        height: _height,
      ),
    );
  }
}
