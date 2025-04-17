import 'package:apartment_admin/core/SERVER/root_link_api.dart';

class Orderslinkapi {
  static String baseUrl = "$rootLink/orders";
  static String getOrders = "$baseUrl/view_orders.php";
  static String accepteOrder = "$baseUrl/accepte_order.php";
}
