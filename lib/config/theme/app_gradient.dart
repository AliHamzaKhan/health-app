import 'package:flutter/material.dart';
import 'app_colors.dart';

createLinearGradient(
    {List<Color>? colors,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<double>? stops,
    TileMode? tileMode}) {
  return LinearGradient(
      colors: colors ?? [

        // AppColors.primary.withOpacity(0.5),
        AppColors.primary2,
        AppColors.primary,
      ],
      begin: begin ??  Alignment.topLeft,
      end: end ?? Alignment.bottomRight,
      stops: stops,
      tileMode: tileMode ?? TileMode.clamp);
}
