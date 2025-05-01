import 'package:apartment_admin/Features/orders/repository/order_repository.dart';
import 'package:apartment_admin/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_admin/core/model/orderModel.dart';
import 'package:apartment_admin/core/shared/cutsom_loding_dialog.dart';
import 'package:apartment_admin/core/shared/dialgos_widgets.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  Future<void> accepteOrder({
    required int orderID,
    required statusID,
    required int apartmentID,
  });
  Future<void> getOrders();
}

class OrderControllerImpl extends OrderController {
  final OrderRepository _repository;

  List<Ordermodel> orders = [];

  OrderControllerImpl({required OrderRepository repository})
    : _repository = repository;

  @override
  Future<void> accepteOrder({
    required int orderID,
    required statusID,
    required int apartmentID,
  }) async {
    try {
      showLoding();
      final response = await _repository.accepteOrder(
        id: orderID,
        status: statusID,
        apartmetID: apartmentID,
      );
      Get.back();
      response.fold(
        (failure) {
          handleError(failure);
        },
        (r) {
          Get.back();
          handleSuccess();
          getOrders();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErorrDilaog(message: "$e"));
    }
  }

  @override
  Future<void> getOrders() async {
    // try {
    final response = await _repository.viewOrders();
    response.fold(
      (failure) {
        handleError(failure);
      },
      (data) {
        orders = data;
        update();
      },
    );
    // } catch (e) {
    //   Get.dialog(ErorrDilaog(message: "$e"));
    // }
  }
}
