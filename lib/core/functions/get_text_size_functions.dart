
import 'package:get/get.dart';

double getTextSize({required double fontSize}) {
  double scalfactor = getScaleFactor();

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  double responstiveTextSize = fontSize * scalfactor;
  return responstiveTextSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  double width = Get.size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
