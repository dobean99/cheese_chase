import 'package:cheese_chase/config/assets/assets.dart';
import 'package:cheese_chase/core/constants/app_colors.dart';
import 'package:cheese_chase/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RoundedGradientStrokeButton extends StatelessWidget {
  final double? borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final bool isCircleButton;
  final bool isEnabled;
  final double? paddingChild;

  const RoundedGradientStrokeButton({
    super.key,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient,
    this.onPressed,
    this.isCircleButton = false,
    this.isEnabled = true,
    this.paddingChild,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: Container(
        width: width ?? AppConstants.buttonMenuWidth,
        height: height,
        // padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: isCircleButton
            ? BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      PngAssets.buttonBackground,
                    ),
                    fit: BoxFit.cover),
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: AppConstants.borderWidth,
                ),
              )
            : BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      PngAssets.buttonBackground,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(
                    borderRadius ?? AppConstants.borderRadius),
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: AppConstants.borderWidth,
                ),
              ),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: paddingChild ?? 10),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
