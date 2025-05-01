import 'dart:convert';

import 'package:apartment_admin/core/SERVER/root_link_api.dart';
import 'package:apartment_admin/core/error/failure.dart';
import 'package:apartment_admin/core/model/reqport_model.dart';
import 'package:apartment_admin/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ReportRepository {
  final NetworkInfo networkInfo;
  final GetConnect getConnect;
  ReportRepository({required this.getConnect, required this.networkInfo});
  Future<Either<Failure, List<ReportModel>>> getReports() async {
    if (await networkInfo.isConnected) {
      final response = await getConnect.get(
        "$rootLink/reports/home_reports.php",
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final listData = jsonData;
        return Right(
          listData.map<ReportModel>((e) => ReportModel.fromJson(e)).toList(),
        );
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
