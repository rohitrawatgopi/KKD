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
    // Start the animation right after the first frame is rendered
    Future.delayed(Duration.zero, () {
      setState(() {
        _width = 178; // animate to 200 px width
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _height,
      width: _width,
      duration: Duration(seconds: 2),
      curve: Curves.linear,
      child: Image.asset(AppImage.splashImg, fit: BoxFit.fill),
    );
  }
}
