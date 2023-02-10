import 'package:flutter/cupertino.dart';

import '../constant/colors.dart';
import '../constant/dimes.dart';

class GradientContainerWidget extends StatelessWidget {
  const GradientContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kGradientColor.withOpacity(1), kGradientColor.withOpacity(0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [kGradientColorStartPoint, kGradientColorStopPoint])),
    );
  }
}
