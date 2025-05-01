import 'package:apartment_admin/Features/report/repo/report_repository.dart';
import 'package:apartment_admin/core/functions/handleMessage_function.dart.dart';
import 'package:apartment_admin/core/model/reqport_model.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final ReportRepository _reportRepository;

  ReportController({required ReportRepository reportRepository})
    : _reportRepository = reportRepository;

  List<ReportModel> reports = [];

  Future<void> getReports() async {
    final request = await _reportRepository.getReports();
    request.fold(
      (failure) {
        handleError(failure);
      },
      (data) {
        reports = data;
        update();
      },
    );
  }
}
