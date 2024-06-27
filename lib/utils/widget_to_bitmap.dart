
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//
//
// extension ToBitDescription on Widget {
//   Future<BitmapDescriptor> toBitmapDescriptor(
//       {Size? logicalSize,
//         Size? imageSize,
//         Duration waitToRender = const Duration(milliseconds: 300),
//         TextDirection textDirection = TextDirection.ltr}) async {
//     final widget = RepaintBoundary(
//       child: MediaQuery(
//           data: const MediaQueryData(),
//           child: Directionality(textDirection: TextDirection.ltr, child: this)),
//     );
//     final pngBytes = await createImageFromWidget(widget,
//         waitToRender: waitToRender,
//         logicalSize: logicalSize,
//         imageSize: imageSize);
//     return BitmapDescriptor.fromBytes(pngBytes);
//   }
// }
//
// /// Creates an image from the given widget by first spinning up a element and render tree,
// /// wait [waitToRender] to render the widget that take time like network and asset images
//
// /// The final image will be of size [imageSize] and the the widget will be layout, ... with the given [logicalSize].
// /// By default Value of  [imageSize] and [logicalSize] will be calculate from the app main window
//
// Future<Uint8List> createImageFromWidget(Widget widget,
//     {Size? logicalSize,
//       required Duration waitToRender,
//       Size? imageSize}) async {
//   final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
//   final view = ui.PlatformDispatcher.instance.views.first;
//   logicalSize ??= view.physicalSize;
//   imageSize ??= view.physicalSize;
//
//   // assert(logicalSize.aspectRatio == imageSize.aspectRatio);
//
//   final RenderView renderView = RenderView(
//     view: view,
//     child: RenderPositionedBox(
//         alignment: Alignment.center, child: repaintBoundary),
//     configuration: ViewConfiguration(
//       physicalConstraints:
//       BoxConstraints.tight(logicalSize) * view.devicePixelRatio,
//       logicalConstraints: BoxConstraints.tight(logicalSize),
//       devicePixelRatio: view.devicePixelRatio,
//     ),
//   );
//
//   final PipelineOwner pipelineOwner = PipelineOwner();
//   final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
//
//   pipelineOwner.rootNode = renderView;
//   renderView.prepareInitialFrame();
//
//   final RenderObjectToWidgetElement<RenderBox> rootElement =
//   RenderObjectToWidgetAdapter<RenderBox>(
//     container: repaintBoundary,
//     child: widget,
//   ).attachToRenderTree(buildOwner);
//
//   buildOwner.buildScope(rootElement);
//
//   await Future.delayed(waitToRender);
//
//   buildOwner.buildScope(rootElement);
//   buildOwner.finalizeTree();
//
//   pipelineOwner.flushLayout();
//   pipelineOwner.flushCompositingBits();
//   pipelineOwner.flushPaint();
//
//   final ui.Image image = await repaintBoundary.toImage(
//       pixelRatio: imageSize.width / logicalSize.width);
//   final ByteData? byteData =
//   await image.toByteData(format: ui.ImageByteFormat.png);
//
//   return byteData!.buffer.asUint8List();
// }

// it is another code
class MarkersWithLabel {
  static Future<Uint8List?> getBytesFromCanvasDynamic(
      {required String iconPath,
        required String plateReg,
        required double fontSize,
        required Size iconSize}) async {
    final Paint paint = Paint()
      ..color = const Color.fromARGB(255, 240, 200, 50);
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    //The label code
    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
        letterSpacing: 1.0,
      ),
      text: plateReg.length > 15 ? plateReg.substring(0, 15) + '...' : plateReg,
    );

    TextPainter painter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: ui.TextDirection.ltr);
    painter.text = TextSpan(
        text:
        plateReg.length > 15 ? plateReg.substring(0, 15) + '...' : plateReg,
        style: TextStyle(
            fontSize: fontSize,
            letterSpacing: 2,
            color: Colors.black,
            fontWeight: FontWeight.w600));

    painter.layout(
      minWidth: 0,
    );
    int halfTextHeight = painter.height ~/ 2;
    double fortyPercentWidth = painter.width * 0.20;
    int textWidth = painter.width.toInt() + fortyPercentWidth.toInt();
    int textHeight = painter.height.toInt() + halfTextHeight;

    // Text box rectangle for Vehicle registration label
    Rect rect =
    Rect.fromLTWH(0, 0, textWidth.toDouble(), textHeight.toDouble());
    RRect rectRadius = RRect.fromRectAndRadius(rect, const Radius.circular(10));

    canvas.drawRRect(rectRadius, paint);
    painter.paint(
        canvas, Offset(fortyPercentWidth / 2, halfTextHeight.toDouble() / 2));

    double x = (textWidth) / 2;
    double y = textHeight.toDouble();

    Path arrow = Path()
      ..moveTo(x - 25, y)
      ..relativeLineTo(50, 0)
      ..relativeLineTo(-25, 25)
      ..close();

    // Draw an arrow under the Text Box Label
    canvas.drawPath(arrow, paint);

    // Load the icon from the path as a list of bytes
    final ByteData dataStart = await rootBundle.load(iconPath);

    // Resize the icon to a smaller size. If the icons by default have a huge size will be crazy big on the screen.
    // I discovered in my case that the best iconSize for a custom marker is width = 75 and height = 100.
    ui.Codec codec = await ui.instantiateImageCodec(
        dataStart.buffer.asUint8List(),
        targetWidth: iconSize.width.toInt());
    ui.FrameInfo fi = await codec.getNextFrame();

    Uint8List dataEnd =
    ((await fi.image.toByteData(format: ui.ImageByteFormat.png)) ??
        ByteData(0))
        .buffer
        .asUint8List();

    ui.Image image = await _loadImage(Uint8List.view(dataEnd.buffer));

    //Move the icon from left to right or up to down
    canvas.drawImage(image, Offset(x - (image.width / 2), y + 25), Paint());

    ui.Picture p = pictureRecorder.endRecording();

    //This sets the total height of the icon along with the text
    ByteData? pngBytes = await (await p.toImage(
      textWidth < image.width ? image.width : textWidth,
      textHeight + image.height + 25,
    ))
        .toByteData(format: ui.ImageByteFormat.png);

    return pngBytes?.buffer.asUint8List();
  }

  static Future<ui.Image> _loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}