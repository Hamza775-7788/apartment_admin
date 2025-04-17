import 'package:apartment_admin/Features/orders/viewModel/order_ditalse_viewModel.dart';
import 'package:apartment_admin/core/model/orderModel.dart';
import 'package:apartment_admin/core/shared/buttons.dart';
import 'package:apartment_admin/core/shared/my_body_pages.dart';
import 'package:apartment_admin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class OrderDitles extends StatefulWidget {
  final Ordermodel order;
  const OrderDitles({required this.order, super.key});

  @override
  State<OrderDitles> createState() => _OrderDitlesState();
}

class _OrderDitlesState extends State<OrderDitles> {
  OrderDitalseViewmodel viewmodel = OrderDitalseViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewmodel.title)),

      body: MyBodyPages(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                widget.order.title,
                style: AppTextStyles.normaBoldlTitle(),
              ),
              subtitle: Text(
                "${widget.order.governorate} -> ${widget.order.city} -> ${widget.order.street}",
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("الاسم", style: AppTextStyles.normaBoldlTitle()),
              subtitle: Text(widget.order.name),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("رقم الهاتف", style: AppTextStyles.normaBoldlTitle()),
              subtitle: Text(widget.order.phoneNumber),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "عدد الاولاد",
                style: AppTextStyles.normaBoldlTitle(),
              ),
              subtitle: Text(widget.order.children.toString()),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("نوع العمل", style: AppTextStyles.normaBoldlTitle()),
              subtitle: Text(widget.order.jobsType),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "نوع الضمانة",
                style: AppTextStyles.normaBoldlTitle(),
              ),
              subtitle: Text(widget.order.guaranteesType),
            ),
            const SizedBox(height: 16),
            if (widget.order.status == 0)
              MyGenralButton(
                name: viewmodel.accepteLable,
                onPressed: () {
                  viewmodel.onChange(
                    aprtmentID: widget.order.apartmentId,
                    orderID: widget.order.id,
                  );
                },
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
