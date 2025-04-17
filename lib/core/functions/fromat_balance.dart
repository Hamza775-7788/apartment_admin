
import 'package:apartment_admin/core/shared/MyPriceForamt_widget.dart';
import 'package:get/get.dart';

String formatBalance(double balance, {bool withName = false}) {
  String formatNumber = '';
  double number = balance;
  String credit = Get.locale!.languageCode == "ar" ? "مدين" : "credit";
  String debit = Get.locale!.languageCode == "ar" ? "دائن" : "debit";
  String balanceName = Get.locale!.languageCode == "ar" ? "الرصيد" : "Balance";
  if (balance.isNegative) {
    if (withName) {
      formatNumber = "$balanceName ${amountFromate(number.abs())} $credit";
    } else {
      formatNumber = "${amountFromate(number.abs())} $credit";
    }
  } else {
    if (withName) {
      formatNumber = "$balanceName ${amountFromate(number.abs())} $debit";
    } else {
      formatNumber = "${amountFromate(number.abs())} $debit";
    }
  }
  return formatNumber;
}
