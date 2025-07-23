import 'package:flutter_svg/flutter_svg.dart';
import 'package:paint_shop/app/import.dart';

class NavIcon extends StatelessWidget {
  String? asset;
  String? label;
  bool? isActive;
  VoidCallback? onTap;

  NavIcon({
    required this.asset,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive! ? Theme.of(context).primaryColor : Colors.grey;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(asset!, width: 24, height: 24, color: Colors.black),
          const SizedBox(height: 4),
          Text(label!, style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}
