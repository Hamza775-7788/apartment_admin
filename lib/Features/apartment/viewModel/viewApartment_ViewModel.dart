import 'package:apartment_admin/Features/apartment/controller/apartment_controller.dart';
import 'package:apartment_admin/core/model/apartment_model.dart';
import 'package:apartment_admin/core/model/category_or_unit_entiry.dart';
import 'package:apartment_admin/main.dart';
import 'package:get/get.dart';

class ApartmentApdminViewModel {
  String title = "شقق".tr;

  ApartmentApdminViewModel() {
    _controllerImpl.viewByAccess(type: type);
  }

  List<EilmentModel> category = [
    EilmentModel(id: 0, nameAr: "الطلبات المعلقة", nameEn: ""),
    EilmentModel(id: 1, nameAr: "الطلبات المفبولة", nameEn: ""),
    EilmentModel(id: 2, nameAr: "المؤجرة", nameEn: ""),
  ];
  int type = 0;
  onSlect(int id) {
    type = id;
    _controllerImpl.viewByAccess(type: id);
  }

  ApartmentControllerImpl _controllerImpl = Get.put(
    getIt!<ApartmentControllerImpl>(),
  );

  List<ApartmentModel> get apartmentList {
    return _controllerImpl.apartments;
  }
}
