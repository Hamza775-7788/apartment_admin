
import 'package:apartment_admin/core/constant/ads_list.dart';
import 'package:flutter/material.dart';

class ApartmentImageView extends StatefulWidget {
  final List images;
  final PageController controller;
  const ApartmentImageView({
    required this.controller,
    required this.images,
    super.key,
  });

  @override
  State<ApartmentImageView> createState() => _ApartmentImageViewState();
}

class _ApartmentImageViewState extends State<ApartmentImageView> {
  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty
        ? ClipRRect(
          borderRadius: BorderRadius.circular(8),

          child: Image.asset(AdsList.ads.first, fit: BoxFit.cover),
        )
        : PageView.builder(
          onPageChanged: (v) {
            widget.controller.animateToPage(
              v,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            );
          },
          controller: widget.controller,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(widget.images[index], fit: BoxFit.cover),
              ),
            );
          },
        );
  }
}
