import 'package:flutter/material.dart';

class PagenationWidgetCircularProgress extends StatelessWidget {
  const PagenationWidgetCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        child: const Center(child: CircularProgressIndicator()));
  }
}
