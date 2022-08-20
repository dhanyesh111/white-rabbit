import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String image;
  final double? radius;
  const ImageLoader({Key? key, required this.image, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 90),
      child: Image.network(
        image,
        fit: BoxFit.fill,
        height: radius ?? 90,
        width: radius ?? 90,
        errorBuilder: (context, object, stacktrace) {
          return Container(
            height: radius ?? 90,
            width: radius ?? 90,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white54),
            child: Icon(
              Icons.wallpaper_rounded,
              size: (radius ?? 60) - 30,
            ),
          );
        },
      ),
    );
  }
}
