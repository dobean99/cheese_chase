import 'package:cheese_chase/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  const StrokeText({
    Key? key,
    required this.text,
    this.strokeWidth,
  }) : super(key: key);

  final String text;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth ?? 2
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
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textTitleColor,
          ),
        ),
      ],
    );
  }
}
