import 'package:apartment_admin/core/constant/ads_list.dart';
import 'package:apartment_admin/core/constant/images.dart';
import 'package:apartment_admin/core/functions/get_text_size_functions.dart';
import 'package:apartment_admin/core/model/apartment_model.dart';
import 'package:apartment_admin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListTileWidget extends StatelessWidget {
  const ItemListTileWidget({
    required this.onTap,
    super.key,
    required this.item,
  });

  final ApartmentModel item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Get.theme.colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 5,
            offset: Offset(0, 5),
            spreadRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: getTextSize(fontSize: 150),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child:
                      item.images.isEmpty
                          ? Image.asset(
                            AdsList.ads.first,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                          : Image.network(
                            item.images.first,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.apartmentTypeNameAr,
                      style: AppTextStyles.normaBoldlTitle(),
                    ),

                    Text(
                      item.apartmentTitle,
                      style: AppTextStyles.normaBoldlTitle(),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.address,
                          height: getTextSize(fontSize: 20),
                        ),
                        Expanded(
                          child: Text(
                            "${item.governorate}/${item.city}/${item.street}",
                            style: AppTextStyles.description,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: item.statusColor,
                      ),
                      child: Text(
                        item.statusName,
                        style: TextStyle(
                          color: Get.theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
