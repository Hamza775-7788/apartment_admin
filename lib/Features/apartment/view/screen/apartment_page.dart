import 'package:apartment_admin/Features/apartment/controller/apartment_controller.dart';
import 'package:apartment_admin/Features/apartment/view/screen/aprtment_datiles.dart';
import 'package:apartment_admin/Features/apartment/view/widget/item_list_tile_widget.dart';
import 'package:apartment_admin/Features/apartment/viewModel/viewApartment_ViewModel.dart';
import 'package:apartment_admin/core/shared/buttons.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApartmentPage extends StatefulWidget {
  const ApartmentPage({super.key});

  @override
  State<ApartmentPage> createState() => _ApartmentPageState();
}

class _ApartmentPageState extends State<ApartmentPage> {
  ApartmentApdminViewModel viewModel = ApartmentApdminViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<ApartmentControllerImpl>(
        builder: (_) {
          return Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: viewModel.category.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = viewModel.category[index];
                    return MyFilterButton(
                      onTap: () {
                        viewModel.onSlect(item.id);
                      },
                      selectID: viewModel.type,
                      category: item,
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: viewModel.apartmentList.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.apartmentList[index];
                    return ItemListTileWidget(
                      item: item,
                      onTap: () {
                        Get.to(
                          () =>
                              AprtmentDatiles(isUpdate: true, apartment: item),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
