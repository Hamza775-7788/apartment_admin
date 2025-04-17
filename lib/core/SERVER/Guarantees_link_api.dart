import 'package:apartment_admin/core/SERVER/root_link_api.dart';

class GuaranteesLinkApi {
  static String baseUrl = "$rootLink/guarantees";
  static String add = "$baseUrl/add.php";
  static String update = "$baseUrl/update.php";
  static String delete = "$baseUrl/delete.php";
  static String view = "$baseUrl/view.php";
}
