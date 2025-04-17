import 'package:apartment_admin/Features/guarantees/controller/guarantees_controller.dart';
import 'package:apartment_admin/core/model/category_or_unit_entiry.dart';
import 'package:apartment_admin/core/shared/dialgos_widgets.dart';
import 'package:apartment_admin/main.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GuaranteesElmentViewModel {
  String title = "انواع الضمانات";
  String addLable = "اضافة";
  String updateLable = "تعديل";
  String deleteLable = "حذف";
  String clearLable = "مسح";
  String idLable = "المعرف";
  String nameLable = "الاسم العربي";
  String nameEnLable = "الاسم الاجنبي";
  late TextEditingController idController;
  late TextEditingController nameArController;
  late TextEditingController nameEnController;

  onTap(EilmentModel eilmentModel) {
    idController.text = eilmentModel.id.toString();
    nameEnController.text = eilmentModel.nameEn;
    nameArController.text = eilmentModel.nameAr.toString();
  }

  GuaranteesElmentViewModel() {
    _controllerImpl.view();
  }

  List<EilmentModel> get types {
    return _controllerImpl.types;
  }

  GuaranteesControllerImpl _controllerImpl = Get.put(
    getIt!<GuaranteesControllerImpl>(),
  );

  onAdd() async {
    if (nameArController.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "يجب ادخال الاسم اولا"));
    } else {
      await _controllerImpl.add(
        eilmentModel: EilmentModel(
          id: 0,
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
        ),
      );
      onClear();
    }
  }

  onUpdate() async {
    if (idController.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "يجب اختيار سجل اولا"));
    } else if (nameArController.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "يجب ادخال الاسم اولا"));
    } else {
      await _controllerImpl.updateType(
        eilmentModel: EilmentModel(
          id: int.parse(idController.text),
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
        ),
      );
      onClear();
    }
  }

  onDelete(int? id) {
    if (id == null && idController.text.isEmpty) {
      Get.dialog(ErorrDilaog(message: "يجب اختيار سجل اولا"));
    } else {
      Get.dialog(
        WoringDilaog(
          onSkip: () async {
            await _controllerImpl.delete(
              id: id ?? int.parse(idController.text),
            );
            onClear();
          },
          title: "حذف عنصر",
          message: "هل انت متأكد من عملية الحذف",
        ),
      );
    }
  }

  onClear() {
    idController.clear();
    nameArController.clear();
    nameEnController.clear();
  }
}
