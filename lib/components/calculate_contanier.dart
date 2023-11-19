import 'package:flutter/material.dart';

import '../constant.dart';

class CalculateContainer extends StatelessWidget {
  String text;
  CalculateContainer(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity, //ekranin genişliği ne kadarsa hepsini kaplar
      color: kBottomContainerColor,
      height: kBottomContainerHeight,
      margin: const EdgeInsets.only(top: 10),
      child: Text(text, style: kLabelTextStyle,),
    );
  }
}
