import 'package:flutter/material.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget({Key? key,required this.text,this.color=Colors.white,this.fontsize=20}) : super(key: key);
  final String text;
  final Color? color;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color: color,
      fontSize: fontsize,
    ),
    );
  }
}
