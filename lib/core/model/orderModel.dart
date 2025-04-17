import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ordermodel {
  final int id;
  final int apartmentId;
  final int userId;
  final int children;
  final int jobTypeId;
  final String phoneNumber;
  final int status;
  final int typesGuaranteesId;
  final String name;
  final String? profile;
  final String email;
  final String jobsType;
  final String guaranteesType;
  final String apartmentType;
  final String title;
  final String price;
  final String city;
  final String street;
  final String governorate;

  Ordermodel({
    required this.id,
    required this.apartmentId,
    required this.userId,
    required this.children,
    required this.jobTypeId,
    required this.phoneNumber,
    required this.status,
    required this.typesGuaranteesId,
    required this.name,
    this.profile,
    required this.email,
    required this.jobsType,
    required this.guaranteesType,
    required this.apartmentType,
    required this.title,
    required this.price,
    required this.city,
    required this.street,
    required this.governorate,
  });

  factory Ordermodel.fromJson(Map<String, dynamic> json) {
    return Ordermodel(
      id: json['id'],
      apartmentId: json['apratment_id'],
      userId: json['user_id'],
      children: json['children'],
      jobTypeId: json['jop_type_id'],
      phoneNumber: json['phoneNumber'],
      status: json['status'],
      typesGuaranteesId: json['types_guarantees_id'],
      name: json['name'],
      profile: json['profile'],
      email: json['email'],
      jobsType: json['jops_type'],
      guaranteesType: json['guarantees_type'],
      apartmentType: json['apartment_type'],
      title: json['title'],
      price: json['price'],
      city: json['city'],
      street: json['street'],
      governorate: json['governorate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "apratment_id": apartmentId,
      "user_id": userId,
      "children": children,
      "jop_type_id": jobTypeId,
      "phoneNumber": phoneNumber,
      "status": status,
      "types_guarantees_id": typesGuaranteesId,
      "name": name,
      "profile": profile,
      "email": email,
      "jops_type": jobsType,
      "guarantees_type": guaranteesType,
      "apartment_type": apartmentType,
      "title": title,
      "price": price,
      "city": city,
      "street": street,
      "governorate": governorate,
    };
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
