import 'package:flutter/material.dart';

class ConditoinCard extends StatelessWidget {
  final double width;
  final double height;
  final List<Color> gradient;
  final ImageIcon icon;
  final Color iconColor;
  final String title;
  final TextStyle textStyle;
  final Function() onTap;

  const ConditoinCard({
    super.key,
    required this.gradient,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.textStyle,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              icon.image,
              color: iconColor,
            ),
            Text(
              title,
              style: textStyle,
            )
          ],
        ),
      ),
      onPressed: onTap,
    );
  }
}
