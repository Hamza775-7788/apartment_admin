import 'package:apartment_admin/Features/orders/controller/order_controller.dart';
import 'package:apartment_admin/core/model/orderModel.dart';
import 'package:apartment_admin/main.dart';
import 'package:get/get.dart';

class OrdersViewModel {
  String title = "طلبات التأجير";
  String subtitle = "جميع الطلبات ";

  OrdersViewModel() {
    _controllerImpl.getOrders();
  }

  OrderControllerImpl _controllerImpl = Get.put(getIt!<OrderControllerImpl>());

  List<Ordermodel> get orders {
    return _controllerImpl.orders;
  }

  onTap(Ordermodel order) {}
}
