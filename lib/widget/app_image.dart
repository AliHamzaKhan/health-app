import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../utils/app_print.dart';

class ImageDisplay extends StatelessWidget {
  const ImageDisplay({
    super.key,
    required this.image,
    required this.size,
    this.boxFit,
    this.color,
    this.isNetwork = false,
  });

  final Size size;
  final dynamic image; // Use dynamic for file and other types
  final BoxFit? boxFit;
  final Color? color;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return getImage();
  }

  Widget getImage() {
    if (image == '') return const SizedBox(); // Return empty if image is an empty string

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
      // Check if the string is a Base64 image
      if (image.startsWith('Base64:img/')) {
        String base64String = image.replaceFirst('Base64:img/', '');
        Uint8List bytes = base64Decode(base64String);
        return Image.memory(
          bytes,
          width: setHeightValue(size.width),
          height: setHeightValue(size.height),
          fit: boxFit ?? BoxFit.contain,
          color: color,
        );
      }

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

    // For icons or other types
    return Icon(
      image,
      size: setHeightValue(size.height),
      color: color,
    );
  }

  // Placeholder function to set the height value based on some criteria
  double setHeightValue(double value) {
    // Implement your logic to set height value as needed
    return value; // Placeholder
  }
}