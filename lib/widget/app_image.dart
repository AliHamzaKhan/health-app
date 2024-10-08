import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../utils/app_print.dart';

class ImageDisplay extends StatelessWidget {
  ImageDisplay(
      {super.key,
      required this.image,
      required this.size,
      this.boxFit,
      this.color,
      this.isNetwork = false});

  Size size;
  var image;
  BoxFit? boxFit;
  Color? color;
  bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return getImage();
  }

  Widget getImage() {
    if (image == '') return const SizedBox();

    if (image is File) {
      return Image.file(
        image,
        width: setHeightValue(size.width),
        height: setHeightValue(size.height),
        fit: boxFit ?? BoxFit.contain,
        color: color,
      );
    }

    if (image is String) {
      if (isNetwork) {
        appDebugPrint('isNetwork $image');
        return ClipRRect(
          borderRadius: BorderRadius.circular(setHeightValue(100)),
          child: CachedNetworkImage(
            imageUrl: image,
            width: setHeightValue(size.width),
            height: setHeightValue(size.height),
            fit: boxFit ?? BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.person),
          ),
        );
      }

      return Image.asset(
        image,
        width: setHeightValue(size.width),
        height: setHeightValue(size.height),
        fit: boxFit ?? BoxFit.contain,
        color: color,
      );
    }

    return Icon(
      image,
      size: setHeightValue(size.height),
      color: color,
    );
  }
// getImage() {
//   if(image != ''){
//     return;
//   }
//   if(image is File){
//     return Image.file(
//       image,
//       width: setHeightValue(size.width),
//       height: setHeightValue(size.height),
//       fit: boxFit ?? BoxFit.contain,
//       color: color,
//     );
//   }
//   else if (image is String) {
//     if (isNetwork) {
//       appDebugPrint('isNetwork $image');
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(setHeightValue(100)),
//         child: CachedNetworkImage(
//           imageUrl: image,
//           width: setHeightValue(size.width),
//           height: setHeightValue(size.height),
//           fit: boxFit ?? BoxFit.cover,
//           placeholder: (context, url) => const CircularProgressIndicator(),
//           errorWidget: (context, url, error) => const Icon(Icons.person),
//         ),
//       );
//     } else {
//       return Image.asset(
//         image,
//         width: setHeightValue(size.width),
//         height: setHeightValue(size.height),
//         fit: boxFit ?? BoxFit.contain,
//         color: color,
//       );
//     }
//   } else {
//     return Icon(
//       image,
//       size: size.height,
//       color: color,
//     );
//   }
// }
}
