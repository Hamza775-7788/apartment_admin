import 'package:apartment_admin/Features/orders/controller/order_controller.dart';
import 'package:apartment_admin/main.dart';
import 'package:get/get.dart';

class OrderDitalseViewmodel {
  String title = "تفاصيل الطلب";
  String accepteLable = "موافقة على الطلب";

  OrderControllerImpl _controllerImpl = Get.put(getIt!<OrderControllerImpl>());

  onChange({required int aprtmentID, required int orderID}) {
    _controllerImpl.accepteOrder(
      orderID: orderID,
      statusID: 1,
      apartmentID: aprtmentID,
    );
  }
}
