import 'package:apartment_admin/Features/orders/controller/order_controller.dart';
import 'package:apartment_admin/Features/orders/viewModel/orders_view_model.dart';
import 'package:apartment_admin/Features/orders/views/order_ditles.dart';
import 'package:apartment_admin/core/shared/my_title_with_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Orderviewpage extends StatefulWidget {
  const Orderviewpage({super.key});

  @override
  State<Orderviewpage> createState() => _OrderviewpageState();
}

class _OrderviewpageState extends State<Orderviewpage> {
  OrdersViewModel viewModel = OrdersViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<OrderControllerImpl>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: MyTitleWithLineWidget(title: viewModel.subtitle),
                ),
                SliverList.builder(
                  itemCount: viewModel.orders.length,
                  itemBuilder: (context, index) {
                    final order = viewModel.orders[index];
                    return ListTile(
                      onTap: () {
                        Get.to(() => OrderDitles(order: order));
                      },
                      contentPadding: EdgeInsets.all(0),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: order.statusColor,
                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: Text(
                          order.statusName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(order.title),
                      subtitle: Text(order.name),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
