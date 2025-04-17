import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageIndecator extends StatefulWidget {
  final int length;
  final PageController controller;
  const ImageIndecator({
    required this.controller,
    required this.length,
    super.key,
  });

  @override
  State<ImageIndecator> createState() => _ImageIndecatorState();
}

class _ImageIndecatorState extends State<ImageIndecator> {
  @override
  Widget build(BuildContext context) {
    return SmoothIndicator(
      effect: ScaleEffect(dotHeight: 5, dotWidth: 5),
      offset: widget.controller.offset,
      count: widget.length,
      size: Size(3, 3),
    );
  }
}
