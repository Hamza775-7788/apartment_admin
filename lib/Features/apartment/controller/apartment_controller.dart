import 'package:apartment_admin/Features/apartment/repository/Apartment_repostory.dart';
import 'package:apartment_admin/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_admin/core/model/apartment_model.dart';
import 'package:apartment_admin/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_admin/core/shared/dialgos_widgets.dart';
import 'package:get/get.dart';

abstract class ApartmentController extends GetxController {
  Future<void> viewByAccess({required int type});
  Future<void> viewByID({required int id});
  Future<void> delete({required int id});
  Future<void> changeStatus({required int statusID, required int aportmentID});
}

class ApartmentControllerImpl extends ApartmentController {
  final ApartmentRepostory _repostory;

  ApartmentControllerImpl({required ApartmentRepostory repostory})
    : _repostory = repostory;

  List<ApartmentModel> apartments = [];
  ApartmentModel? apartmentOne;
  @override
  Future<void> changeStatus({
    required int statusID,
    required int aportmentID,
  }) async {
    try {
      showLoding();
      final response = await _repostory.changeStatus(
        apartmentID: aportmentID,
        statusID: statusID,
      );
      Get.back();
      response.fold(
        (failure) {
          handleError(failure);
        },
        (_) {
          Get.back();
          handleSuccess();
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
      final response = await _repostory.delete(apartmentID: id);
      Get.back();
      response.fold(
        (failure) {
          handleError(failure);
        },
        (_) {
          Get.back();
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> viewByAccess({required int type}) async {
    try {

      final response = await _repostory.view(type: type);
  
      response.fold(
        (failure) {
          handleError(failure);
        },
        (data) {
          apartments = data;
          update();
        },
      );
    } catch (e) {

      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> viewByID({required int id}) async {
    try {

      final response = await _repostory.viewById(id: id);

      response.fold(
        (failure) {
          handleError(failure);
        },
        (data) {
          apartmentOne = data.first;
          update();
        },
      );
    } catch (e) {

      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }
}
