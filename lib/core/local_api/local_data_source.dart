// // ignore_for_file: constant_identifier_names

// import 'dart:convert';

// import 'package:apartment_admin/core/error/function_to_exciprtion.dart';
// import 'package:apartment_admin/featuers/auth/data/model/user_model.dart';

// import 'package:dartz/dartz.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// abstract class LocalDataSource {
//   Future<Unit> cachedUser(UserModel userModel);
//   Future<UserModel> getCachedUser();
//   Future<String> getToken();
//   Future<Unit> setToken(String token);
//   Future<Unit> signOut();
// }

// const String CACHED_USER = "CACHED_USER";
// const String CACHED_TOKEN = "CACHED_TOKEN";

// class LocalDataSourceImpl implements LocalDataSource {
//   final SharedPreferences sharedPreferences;
//   LocalDataSourceImpl({required this.sharedPreferences});
//   @override
//   Future<Unit> cachedUser(UserModel userModel) async {
//     final body = userModel.toJson();
//     final jsonData = jsonEncode(body);
//     sharedPreferences.setString(CACHED_USER, jsonData);
//     return Future.value(unit);
//   }

//   @override
//   Future<UserModel> getCachedUser() async {
//     String? userData = sharedPreferences.getString(CACHED_USER);
//     if (userData != null) {
//       final jsonData = jsonDecode(userData);
//       return UserModel.fromJson(jsonData);
//     } else {
//       throw codeToException(302);
//     }
//   }

//   @override
//   Future<Unit> signOut() {
//     sharedPreferences.clear();
//     return Future.value(unit);
//   }

//   @override
//   Future<String> getToken() async {
//     final String? token = sharedPreferences.getString(CACHED_TOKEN);
//     if (token != null) {
//       return token;
//     } else {
//       throw codeToException(302);
//     }
//   }

//   @override
//   Future<Unit> setToken(String token) async {
//     sharedPreferences.setString(CACHED_TOKEN, token);
//     return Future.value(unit);
//   }
// }
