import 'package:flutter/material.dart';
import '../constant.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String? label;
  const IconContent([this.icon, this.label]);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15.0,
        ), //icon
        Text(
          label!,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}