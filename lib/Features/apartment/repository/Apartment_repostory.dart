import 'dart:convert';
import 'package:apartment_admin/core/SERVER/apartment.dart';
import 'package:apartment_admin/core/error/failure.dart';
import 'package:apartment_admin/core/model/apartment_model.dart';
import 'package:apartment_admin/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class ApartmentRepostory {
  Future<Either<Failure, Unit>> changeStatus({
    required int apartmentID,
    required statusID,
  });
  Future<Either<Failure, Unit>> delete({required int apartmentID});
  Future<Either<Failure, List<ApartmentModel>>> view({required int type});
  Future<Either<Failure, List<ApartmentModel>>> viewById({required int id});
}

class ApartmentRepostoryImpl extends ApartmentRepostory {
  final GetConnect getConnect;
  final NetworkInfo networkInfo;

  ApartmentRepostoryImpl({required this.getConnect, required this.networkInfo});
  @override
  Future<Either<Failure, Unit>> changeStatus({
    required int apartmentID,
    required statusID,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {"apartment_id": apartmentID, "status": statusID};
      final response = await getConnect.post(
        ApartMentApiLink.changeStatus,
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
  Future<Either<Failure, List<ApartmentModel>>> view({
    required int type,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {"access": type};
      final response = await getConnect.post(
        ApartMentApiLink.viewByAccess,
        jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          final list = jsonData['data'] as List;
          return Right(
            list
                .map<ApartmentModel>((e) => ApartmentModel.fromJson(e))
                .toList(),
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

  @override
  Future<Either<Failure, Unit>> delete({required int apartmentID}) async {
    if (await networkInfo.isConnected) {
      final body = {"id": apartmentID};
      final response = await getConnect.post(
        ApartMentApiLink.delete,
        jsonEncode(body),
      );
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
  Future<Either<Failure, List<ApartmentModel>>> viewById({
    required int id,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {"id": id, "user_id": null};
      final response = await getConnect.post(
        ApartMentApiLink.viewByID,
        jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          final list = jsonData['data'] as List;
          return Right(
            list
                .map<ApartmentModel>((e) => ApartmentModel.fromJson(e))
                .toList(),
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
