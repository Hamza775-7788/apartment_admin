import 'package:apartment_admin/Features/aprtmentType/repository/apartmeintType_repository.dart';
import 'package:apartment_admin/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_admin/core/model/category_or_unit_entiry.dart';
import 'package:apartment_admin/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_admin/core/shared/dialgos_widgets.dart';
import 'package:get/get.dart';

abstract class ApartmentTypeController extends GetxController {
  Future<void> add({required EilmentModel eilmentModel});
  Future<void> updateType({required EilmentModel eilmentModel});
  Future<void> delete({required int id});
  Future<void> view();
}

class ApartmentTypeControllerImpl extends ApartmentTypeController {
  final ApartmentTypeRepository _repository;

  List<EilmentModel> types = [];

  ApartmentTypeControllerImpl({required ApartmentTypeRepository repository})
    : _repository = repository;
  @override
  Future<void> add({required EilmentModel eilmentModel}) async {
    try {
      showLoding();
      final response = await _repository.add(eilmentModel: eilmentModel);
      Get.back();
      response.fold(
        (failure) {
          handleError(failure);
        },
        (_) {
          handleSuccess();
          view();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> delete({required int id}) async {
    try {
      showLoding();
      final response = await _repository.delete(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleError(failure);
        },
        (_) {
          handleSuccess();
          view();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> updateType({required EilmentModel eilmentModel}) async {
    try {
      showLoding();
      final response = await _repository.update(eilmentModel: eilmentModel);
      Get.back();
      response.fold(
        (failure) {
          handleError(failure);
        },
        (_) {
          handleSuccess();
          view();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> view() async {
    // try {
      final response = await _repository.view();

      response.fold(
        (failure) {
          handleError(failure);
        },
        (data) {
          types = data;
          update();
        },
      );
    // } catch (e) {
    //   print("$e");
    //   Get.dialog(ErorrDilaog(message: e.toString()));
    // }
  }
}
