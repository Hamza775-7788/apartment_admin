import 'package:apartment_admin/core/SERVER/root_link_api.dart';

class ApartMentApiLink {
  static String baseUrl = "$rootLink/apartment";

  static String viewByID = "$baseUrl/view.php";
  static String viewByAccess = "$baseUrl/view_by_access.php";
  static String changeStatus = "$baseUrl/accepte_aprartment.php";
  static String delete = "$baseUrl/delete.php";
  static String shearch = "$baseUrl/search.php";
}
