
import 'package:flutter/material.dart';

/************************
 * Title and Button
************************/

class TitleAndButton extends StatelessWidget {
  final String titleName;
  final double fontSize;

  TitleAndButton({
    super.key,
    required this.titleName,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            titleName,
            style:
                TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_right_sharp)),
        )
      ],
    );
  }
}
