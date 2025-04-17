import 'package:apartment_admin/core/constant/strings.dart';
import 'package:apartment_admin/core/error/failure.dart';
import 'package:apartment_admin/core/shared/dialgos_widgets.dart';
import 'package:apartment_admin/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String _mapFailuerToString(Failure failure) {
  switch (failure.runtimeType) {
    case const (EmailWrongFailuer):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.emailwrong
          : MessagesStringsAr.emailwrong;
    case const (EmailExistsFailuer):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.emailExisits
          : MessagesStringsAr.emailExisits;
    case const (TimeDoneFailure):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.timeDon
          : MessagesStringsAr.timeDon;
    case const (CodeIsFailure):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.codeWrong
          : MessagesStringsAr.codeWrong;
    case const (PassowrdWrongFailuer):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.passowrdWoring
          : MessagesStringsAr.passowrdWoring;

    case const (ServerFailure):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.SERVER
          : MessagesStringsAr.SERVER;
    case const (EmptyRemotDataFailure):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.EMPTY_VALUE
          : MessagesStringsAr.EMPTY_VALUE;
    case const (OfflineFailure):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.OFFLINE
          : MessagesStringsAr.OFFLINE;
    case const (UnexpectedErrorFailuer):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.UNKOWEN_ERROR
          : MessagesStringsAr.UNKOWEN_ERROR;
    case const (DuplicateFailuer):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.DUPLOCAT_VALUE
          : MessagesStringsAr.DUPLOCAT_VALUE;
    case const (NameNotEneghFailuer):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.NAME_NOT_ENEGH
          : MessagesStringsAr.NAME_NOT_ENEGH;
    case const (LinkedRecourdFailuer):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.LINKED_RECOURD
          : MessagesStringsAr.LINKED_RECOURD;
    case const (ImageToLagargeFailure):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.imageToLatege
          : MessagesStringsAr.imageToLatege;
    case const (InvalidImageTypeFailure):
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.invalidImageType
          : MessagesStringsAr.invalidImageType;
    default:
      return Get.locale!.languageCode == "en"
          ? MessagesStringsEn.UNKOWEN_ERROR
          : MessagesStringsAr.UNKOWEN_ERROR;
  }
}

// handleError(Failure failure) {
//   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
//     showCloseIcon: true,
//     content: Text(_mapFailuerToString(failure)),
//     backgroundColor: Colors.red,
//     behavior: SnackBarBehavior.floating,
//   ));
// }
handleError(Failure failure) {
  if (failure.runtimeType == EmptyRemotDataFailure) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: Text(_mapFailuerToString(failure)),
        backgroundColor: redColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  } else if (failure.runtimeType == OfflineFailure) {
    Get.dialog(const OfflineDilaog());
  } else if (failure.runtimeType == ServerFailure) {
    Get.dialog(ServerErorr(message: _mapFailuerToString(failure)));
  } else {
    Get.dialog(ErorrDilaog(message: _mapFailuerToString(failure)));
  }
}

handleSuccess() {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    const SnackBar(
      showCloseIcon: true,
      content: Text("success"),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
