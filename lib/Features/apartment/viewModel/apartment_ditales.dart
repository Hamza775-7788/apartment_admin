import 'package:apartment_admin/Features/apartment/controller/apartment_controller.dart';
import 'package:apartment_admin/main.dart';
import 'package:get/get.dart';

class ApartmentDitalesViewMode {
  String title = "تفاصيل الشقة";
  String deleteLable = "حذف";
  String sendRequst = "طلب تأجير";
  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );
  onDelete(int id) {
    _controllerImpl.delete(id: id);
  }

  onChangeStatus(int id, int statusID) {
    _controllerImpl.changeStatus(statusID: statusID, aportmentID: id);
  }
}
