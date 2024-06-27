
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../config/size_config.dart';


//ignore: must_be_immutable
class PbSingleShimmer extends StatelessWidget {
  PbSingleShimmer(
      {super.key, this.width, this.height, this.margin, this.radius, this.child});

  double? width;
  double? height;
  double? margin;
  double? radius;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: TitlePlaceholder(
        width: width,
        height: height,
        halfRadius: false,
        radius: radius ?? 20,
        margin: margin ?? 16,
        child: child,
      ),
    );
  }
}

//ignore: must_be_immutable
class TitlePlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final bool halfRadius;
  double? margin;
  double? radius;
  Widget? child;

  TitlePlaceholder(
      {Key? key,
      this.width,
      this.height,
      this.halfRadius = true,
      this.margin,
      this.radius,
      this.child
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? setHeightValue(300),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: halfRadius
              ? BorderRadius.only(
                  topRight: Radius.circular(radius ?? 20),
                  bottomRight: Radius.circular(radius ?? 20),
                )
              : BorderRadius.circular(radius ?? 20)),
      margin: EdgeInsets.symmetric(horizontal: margin ?? 16.0, vertical: 5),
      child: child,
    );
  }
}

shimmerForForm(){
  return PbSingleShimmer(
    width: Get.width,
    height: setHeightValue(45),
    radius: 20,
    margin: 0,
  );
}

forLoadingDataShimmer(
    {required child,
    required isDataLoaded,
    required isListEmpty,
    Widget? emptyChild,
      Widget? shimmerChild,
      double? shimmerWidth,
    double? shimmerHeight,
    }) {
  return isDataLoaded
      ? (isListEmpty ? (emptyChild ?? const SizedBox()) : child)
      : (shimmerChild ??
      PbSingleShimmer(
        width: shimmerWidth,
        height: shimmerHeight,
      ));
}
