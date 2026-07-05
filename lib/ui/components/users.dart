import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class UserStatusWidget extends StatefulWidget {
  const UserStatusWidget({super.key});

  @override
  State<StatefulWidget> createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatusWidget> {
  late Future<ui.Image> _img;
  @override
  void initState() {
    super.initState();
    
    _img = _convertImageProviderToUiImage(Image.network('https://avatars.githubusercontent.com/u/193854505?v=4').image);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FutureBuilder(
        future: _img,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return SizedBox(width: 40, height: 40, child: Image.asset("assets/images/default/profile_pic.png"));
          }

          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                  child: CustomPaint(
                    painter: _ShaderHolePainter(image: snapshot.data!),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(width: 12, height: 12),
                ),
              ),
            ],
          );
        } 
      ),
    );
  }
  
}

Future<ui.Image> _convertImageProviderToUiImage(ImageProvider provider) async {
  final Completer<ui.Image> completer = Completer<ui.Image>();
  
  final ImageStream stream = provider.resolve(ImageConfiguration.empty);
  
  late ImageStreamListener listener;
  
  listener = ImageStreamListener(
    (ImageInfo imageInfo, bool synchronousCall) {
      completer.complete(imageInfo.image);
      stream.removeListener(listener);
    },
    onError: (dynamic exception, StackTrace? stackTrace) {
      completer.completeError(exception, stackTrace);
      stream.removeListener(listener);
    },
  );

  stream.addListener(listener);
  return completer.future;
}

class _ShaderHolePainter extends CustomPainter {
  final ui.Image image;
  _ShaderHolePainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / image.width;
    final double scaleY = size.height / image.height;
    
    final double scale = scaleX > scaleY ? scaleX : scaleY;

    final double dx = (size.width - (image.width * scale)) / 2;
    final double dy = (size.height - (image.height * scale)) / 2;

    final Matrix4 matrix = Matrix4.identity()
      ..translateByDouble(dx, dy, 0.0, 1.0)
      ..scaleByDouble(scale, scale, 1, 1);

    final shader = ui.ImageShader(
      image,
      ui.TileMode.clamp,
      ui.TileMode.clamp,
      matrix.storage,
    );

    final paint = Paint()..shader = shader;

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(8.0),
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width-6, size.height-6),
          radius: 8.0,
        ),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_ShaderHolePainter oldDelegate) => image != oldDelegate.image;
}