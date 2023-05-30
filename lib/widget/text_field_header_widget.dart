import 'package:flutter/material.dart';
import 'package:grocery1/constant/constant.dart';

class TextFieldHeader extends StatelessWidget {
  final String labelText;
  final double fontSize;
  final double padding;

  const TextFieldHeader({
    Key? key,
    required this.labelText,
    this.fontSize = 16.0,
    this.padding = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: padding),
          child: Text(
            labelText,
            style: getTextStyle(16, bluePrimary),
          ),
        ),
      ],
    );
  }
}
