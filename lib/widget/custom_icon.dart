import 'package:flutter/cupertino.dart';

class CustomIcon extends StatelessWidget {
  String icon;
  double size;
  Color color;

  CustomIcon(
      {Key? key, required this.icon, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(
        icon,
      ),
      color: color,
      size: size,
    );
  }
}
