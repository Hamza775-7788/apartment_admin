import 'package:apartment_admin/Features/report/controller/report_controller.dart';
import 'package:apartment_admin/core/model/reqport_model.dart';
import 'package:apartment_admin/main.dart';
import 'package:get/get.dart';

class ReportViewmodel {
  String title = "التقارير";

  ReportController _controller = Get.put(getIt!<ReportController>());
  ReportViewmodel() {
    _controller.getReports();
  }
  List<ReportModel> get reports {
    return _controller.reports;
  }
}
