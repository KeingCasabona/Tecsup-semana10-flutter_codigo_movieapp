import 'package:flutter/material.dart';
import 'package:flutter_codigo_movieapp/ui/general/colors.dart';

class LineWidget extends StatelessWidget {
  final double width;
  LineWidget({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      width: width,
      height: 3,
      decoration: BoxDecoration(
        color: kBrandSecondaryColor,
      ),
    );
  }
}
