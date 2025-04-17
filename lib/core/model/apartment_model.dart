import 'dart:convert';

import 'package:apartment_admin/core/SERVER/root_link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApartmentModel {
  int apartmentId;
  String apartmentTitle;
  String governorate;
  String city;
  String street;
  double price;
  String longDescription;
  String shortDescription;
  List<String> images;
  String features;
  String rating;
  DateTime createdAt;
  int status;
  String apartmentTypeNameAr;
  String apartmentTypeNameEn;
  String userName;
  String userEmail;
  String? userPhone;
  String? userProfile;

  ApartmentModel({
    required this.apartmentId,
    required this.apartmentTitle,
    required this.governorate,
    required this.city,
    required this.street,
    required this.price,
    required this.longDescription,
    required this.shortDescription,
    required this.images,
    required this.features,
    required this.rating,
    required this.createdAt,
    required this.status,
    required this.apartmentTypeNameAr,
    required this.apartmentTypeNameEn,
    required this.userName,
    required this.userEmail,
    this.userPhone,
    this.userProfile,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      apartmentId: json['apartment_id'],
      apartmentTitle: json['apartment_title'],
      governorate: json['governorate'],
      city: json['city'],
      street: json['street'],
      price: double.parse(json['price'].toString()),
      longDescription: json['long_description'],
      shortDescription: json['short_description'],
      images: getImages(json['images']),
      features: json['features'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['created_at']),
      status: json['status'],
      apartmentTypeNameAr: json['apartment_type_nameAr'],
      apartmentTypeNameEn: json['apartment_type_nameEn'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      userProfile:
          json['user_profile'] != null
              ? "$uploid/${json['user_profile']}"
              : null,
      userPhone: json['user_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "apartment_id": apartmentId,
      "apartment_title": apartmentTitle,
      "governorate": governorate,
      "city": city,
      "street": street,
      "price": price,
      "long_description": longDescription,
      "short_description": shortDescription,
      "images": jsonEncode(images),
      "features": features,
      "rating": rating,
      "created_at": createdAt.toString(),
      "status": status,
      "apartment_type_nameAr": apartmentTypeNameAr,
      "apartment_type_nameEn": apartmentTypeNameEn,
      "user_name": userName,
      "user_email": userEmail,
      "user_phone": userPhone,
      "user_profile": userProfile,
    };
  }

  get apartment_type {
    return Get.locale?.languageCode == "ar"
        ? apartmentTypeNameAr
        : apartmentTypeNameEn;
  }

  String get statusName {
    switch (status) {
      case (0):
        return "معلقة";
      case (1):
        return "مقبولة";
      case (2):
        return "مؤجرة";
      default:
        return "غير معروف";
    }
  }

  Color get statusColor {
    switch (status) {
      case (0):
        return Colors.red;
      case (1):
        return Get.theme.colorScheme.primary;
      case (2):
        return Colors.green.shade500;
      default:
        return Get.theme.colorScheme.primaryContainer;
    }
  }
}

List<String> getImages(String? images) {
  if (images == null) {
    return [];
  } else {
    final imageList = jsonDecode(images);
    return imageList.map<String>((image) => "$uploid/$image").toList();
  }
}
