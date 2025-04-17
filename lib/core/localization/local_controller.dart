import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalControler extends GetxController {
  Future<void> getCachedLocal();
  void setLocal(String local);
}

const String CACHED_LOCAL = "CACHED_LOCAL";

class LocalContollerImplment extends LocalControler {
  final SharedPreferences sharedPreferences;

  LocalContollerImplment({required this.sharedPreferences});
  Locale? _applocal;
  String localCached = "";
  Locale? get appLocal {
    return _applocal;
  }

  @override
  void onInit() {
    getCachedLocal();
    super.onInit();
  }

  @override
  Future<void> getCachedLocal() async {
    final cachedLocal = await sharedPreferences.getString(CACHED_LOCAL);
    if (cachedLocal != null) {
      _applocal = Locale(cachedLocal);
      localCached = cachedLocal;

      update();
    }
  }

  @override
  void setLocal(String local) {
    sharedPreferences.setString(CACHED_LOCAL, local);
    localCached = local;

    Get.updateLocale(Locale(local));
  }
}
