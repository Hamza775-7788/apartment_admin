import 'dart:convert';

import 'package:apartment_admin/core/SERVER/Guarantees_link_api.dart';
import 'package:apartment_admin/core/error/failure.dart';
import 'package:apartment_admin/core/model/category_or_unit_entiry.dart';
import 'package:apartment_admin/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class GuaranteesRepository {
  Future<Either<Failure, Unit>> add({required EilmentModel eilmentModel});
  Future<Either<Failure, Unit>> update({required EilmentModel eilmentModel});
  Future<Either<Failure, Unit>> delete({required int id});
  Future<Either<Failure, List<EilmentModel>>> view();
}

class GuaranteesRepositoryImpl implements GuaranteesRepository {
  final NetworkInfo networkInfo;
  final GetConnect getConnect;

  GuaranteesRepositoryImpl({
    required this.networkInfo,
    required this.getConnect,
  });
  @override
  Future<Either<Failure, Unit>> add({
    required EilmentModel eilmentModel,
  }) async {
    if (await networkInfo.isConnected) {
      final body = eilmentModel.toJson();
      final response = await getConnect.post(
        GuaranteesLinkApi.add,
        jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          return const Right(unit);
        } else {
          if (jsonData['code'] == 301) {
            return Left(DuplicateFailuer());
          } else {
            throw Exception(jsonData['message']);
          }
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> delete({required int id}) async {
    if (await networkInfo.isConnected) {
      final body = {"id": id};
      final response = await getConnect.post(
        GuaranteesLinkApi.delete,
        jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          return const Right(unit);
        } else {
          if (jsonData['code'] == 301) {
            return Left(DuplicateFailuer());
          } else if (jsonData['code'] == 1451) {
            return Left(LinkedRecourdFailuer());
          } else {
            throw Exception(jsonData['message']);
          }
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> update({
    required EilmentModel eilmentModel,
  }) async {
    if (await networkInfo.isConnected) {
      final body = eilmentModel.toJson();
      final response = await getConnect.post(
        GuaranteesLinkApi.update,
        jsonEncode(body),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          return const Right(unit);
        } else {
          if (jsonData['code'] == 301) {
            return Left(DuplicateFailuer());
          } else {
            throw Exception(jsonData['message']);
          }
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<EilmentModel>>> view() async {
    if (await networkInfo.isConnected) {
      final response = await getConnect.get(GuaranteesLinkApi.view);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status']) {
          final list = jsonData['data'] as List;
          return Right(
            list.map<EilmentModel>((e) => EilmentModel.fromJson(e)).toList(),
          );
        } else {
          if (jsonData['code'] == 301) {
            return Left(DuplicateFailuer());
          } else {
            throw Exception(jsonData['message']);
          }
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
