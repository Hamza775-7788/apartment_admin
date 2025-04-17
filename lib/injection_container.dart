import 'package:apartment_admin/Features/apartment/controller/apartment_controller.dart';
import 'package:apartment_admin/Features/apartment/repository/Apartment_repostory.dart';
import 'package:apartment_admin/Features/aprtmentType/controller/apartment_type_controller.dart';
import 'package:apartment_admin/Features/aprtmentType/repository/apartmeintType_repository.dart';
import 'package:apartment_admin/Features/guarantees/controller/guarantees_controller.dart';
import 'package:apartment_admin/Features/guarantees/repository/guarantees_repository.dart';
import 'package:apartment_admin/Features/jops/controller/jops_type_controller.dart';
import 'package:apartment_admin/Features/jops/repository/jops_type_repository.dart';
import 'package:apartment_admin/Features/orders/controller/order_controller.dart';
import 'package:apartment_admin/Features/orders/repository/order_repository.dart';
import 'package:apartment_admin/core/network/network.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/upload_packge/upload_File.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ========================================
  //  ========= Auth ========================
  // ========================================

  // controller
  sl.registerFactory<OrderControllerImpl>(
    () => OrderControllerImpl(repository: sl()),
  );

  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(getConnect: sl(), networkInfo: sl()),
  );
  // apartment types

  sl.registerFactory<ApartmentTypeControllerImpl>(
    () => ApartmentTypeControllerImpl(repository: sl()),
  );
  sl.registerLazySingleton<ApartmentTypeRepository>(
    () => ApartmeinttypeRepositoryImpl(networkInfo: sl(), getConnect: sl()),
  );
  sl.registerFactory<JopsControllerImpl>(
    () => JopsControllerImpl(repository: sl()),
  );
  sl.registerLazySingleton<JopsTypeRepository>(
    () => JopsTypeRepositoryImpl(networkInfo: sl(), getConnect: sl()),
  );
  sl.registerFactory<GuaranteesControllerImpl>(
    () => GuaranteesControllerImpl(repository: sl()),
  );
  sl.registerLazySingleton<GuaranteesRepository>(
    () => GuaranteesRepositoryImpl(networkInfo: sl(), getConnect: sl()),
  );

  sl.registerFactory<ApartmentControllerImpl>(
    () => ApartmentControllerImpl(repostory: sl()),
  );
  sl.registerLazySingleton<ApartmentRepostory>(
    () => ApartmentRepostoryImpl(networkInfo: sl(), getConnect: sl()),
  );
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<UploaidFiles>(() => UploaidFilesImpl());
  sl.registerLazySingleton(() => GetConnect());
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
