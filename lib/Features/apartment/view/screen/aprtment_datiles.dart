import 'dart:async';

import 'package:apartment_admin/Features/apartment/view/widget/apartment_image_wiget.dart';
import 'package:apartment_admin/Features/apartment/viewModel/apartment_ditales.dart';
import 'package:apartment_admin/core/constant/images.dart';
import 'package:apartment_admin/core/functions/get_text_size_functions.dart';
import 'package:apartment_admin/core/model/apartment_model.dart';
import 'package:apartment_admin/core/shared/MyPriceForamt_widget.dart';
import 'package:apartment_admin/core/shared/buttons.dart';
import 'package:apartment_admin/core/theme/app_theme.dart';
import 'package:apartment_admin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AprtmentDatiles extends StatefulWidget {
  final ApartmentModel apartment;
  final bool isUpdate;
  const AprtmentDatiles({
    required this.apartment,
    required this.isUpdate,
    super.key,
  });

  @override
  State<AprtmentDatiles> createState() => _AprtmentDatilesState();
}

class _AprtmentDatilesState extends State<AprtmentDatiles> {
  ApartmentDitalesViewMode viewMode = ApartmentDitalesViewMode();
  PageController controller = PageController(initialPage: 0);
  Timer? _timer;
  changePage() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (controller.page!.toInt() < widget.apartment.images.length - 1) {
        await controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        await controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewMode.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 1.3,
                child: ApartmentImageView(
                  controller: controller,
                  images: widget.apartment.images,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),

            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: widget.apartment.images.length,
                  effect: WormEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: Get.theme.colorScheme.primary,
                  ), // your preferred effect
                  onDotClicked: (index) {
                    controller.animateToPage(
                      index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(
                widget.apartment.statusName,
                style: TextStyle(color: widget.apartment.statusColor),
              ),
            ),

            SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.apartment.userPhone ?? "",
                      style: AppTextStyles.description,
                    ),
                    Text(
                      widget.apartment.userEmail,
                      style: AppTextStyles.description,
                    ),
                  ],
                ),
                title: Text(
                  widget.apartment.userName,
                  style: AppTextStyles.normaBoldlTitle(),
                ),
              ),
            ),
            SliverToBoxAdapter(child: Divider(thickness: 0.5)),
            SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                trailing: Text(
                  "${amountFromate(widget.apartment.price)} ر.ي",
                  style: AppTextStyles.price,
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppIcons.address,
                      height: getTextSize(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${widget.apartment.governorate}/${widget.apartment.city}/${widget.apartment.street}",
                        style: AppTextStyles.description,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  widget.apartment.apartmentTitle,
                  style: AppTextStyles.normaBoldlTitle(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                widget.apartment.shortDescription,
                style: AppTextStyles.description,
              ),
            ),
            SliverToBoxAdapter(child: Divider(thickness: 0.5)),
            SliverToBoxAdapter(
              child: Text(
                widget.apartment.features,
                style: AppTextStyles.description,
              ),
            ),
            SliverToBoxAdapter(child: Divider(thickness: 0.5)),
            SliverToBoxAdapter(
              child: Text(
                widget.apartment.longDescription,
                style: AppTextStyles.description,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            if (widget.apartment.status != 2)
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: MyGenralButton(
                        color:
                            widget.apartment.status == 1
                                ? Get.theme.colorScheme.primaryContainer
                                : null,
                        name: widget.apartment.status == 0 ? "موافق" : "تعليق",
                        onPressed: () {
                          if (widget.apartment.status == 0) {
                            viewMode.onChangeStatus(
                              widget.apartment.apartmentId,
                              1,
                            );
                          } else {
                            viewMode.onChangeStatus(
                              widget.apartment.apartmentId,
                              0,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: MyGenralButton(
                        color: widget.isUpdate ? redColor : null,
                        name:
                            widget.isUpdate
                                ? viewMode.deleteLable
                                : viewMode.sendRequst,
                        onPressed: () {
                          viewMode.onDelete(widget.apartment.apartmentId);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
