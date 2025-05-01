import 'package:apartment_admin/Features/apartment/view/screen/apartment_page.dart';
import 'package:apartment_admin/Features/orders/views/orderViewPage.dart';
import 'package:apartment_admin/Features/report/view/report_view_page.dart';
import 'package:apartment_admin/Features/settingViewPage.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel {
  String reportLable = "التقارير";
  String orderLable = "طلبات التأجير";
  String apartmentLable = "الشقق";
  String settingLable = "الاعدادات";
  int pageIndex = 0;
  onChange(int index) {
    pageIndex = index;
  }

  List<Widget> pages = [
    ReportViewPage(),
    Orderviewpage(),
    ApartmentPage(),
    SettingViewPage(),
  ];
}
