import 'package:cheese_chase/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  const StrokeText({
    Key? key,
    required this.text,
    this.strokeWidth,
    this.textSize,
  }) : super(key: key);
  final double? textSize;
  final String text;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: textSize ?? 20,
            fontWeight: FontWeight.w700,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth ?? 4
              ..color = AppColors.whiteColor,
          ),
        ),
        // ShaderMask(
        //   shaderCallback: (bounds) {
        //     return gradient.createShader(
        //       Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        //     );
        //   },
        Text(
          text,
          style: TextStyle(
            fontSize: textSize ?? 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textTitleColor,
          ),
        ),
      ],
    );
  }
}
