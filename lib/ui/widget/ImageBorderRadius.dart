import 'package:flutter/material.dart';

class ImageBorderRadius extends StatelessWidget {
  const ImageBorderRadius(@required this.urlString, {this.radius = 10, this.width = 50, this.height = 50, this.fit = BoxFit.cover});
  /// 网络图片地址
  final String? urlString;
  final double radius;
  final double width;
  final double height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        urlString ?? "",
        width: width,
        height: height,
        fit: fit,
      )
    );
  }
}
