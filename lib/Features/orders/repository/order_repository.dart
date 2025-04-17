import 'dart:convert';

import 'package:apartment_admin/core/SERVER/ordersLinkApi.dart';
import 'package:apartment_admin/core/error/failure.dart';
import 'package:apartment_admin/core/model/orderModel.dart';
import 'package:apartment_admin/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<Ordermodel>>> viewOrders();
  Future<Either<Failure, Unit>> accepteOrder({
    required int id,
    required int status,
    required int apartmetID,
  });
}

class OrderRepositoryImpl extends OrderRepository {
  final GetConnect getConnect;
  final NetworkInfo networkInfo;

  OrderRepositoryImpl({required this.getConnect, required this.networkInfo});
  @override
  Future<Either<Failure, Unit>> accepteOrder({
    required int id,
    required int status,
    required int apartmetID,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {"id": id, "status": status, "aprtmentID": apartmetID};
      final response = await getConnect.post(
        Orderslinkapi.accepteOrder,
        jsonEncode(body),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          return const Right(unit);
        } else {
          throw Exception(jsonData['message']);
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Ordermodel>>> viewOrders() async {
    if (await networkInfo.isConnected) {
      final body = {"user_id": null, "id": null};
      final response = await getConnect.post(
        Orderslinkapi.getOrders,
        jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          final list = jsonData['data'] as List;
          return Right(
            list.map<Ordermodel>((e) => Ordermodel.fromJson(e)).toList(),
          );
        } else {
          throw Exception(jsonData['message']);
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
