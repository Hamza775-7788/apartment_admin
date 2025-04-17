import 'package:apartment_admin/Features/aprtmentType/view/views.dart';
import 'package:apartment_admin/Features/guarantees/view/views.dart';
import 'package:apartment_admin/Features/jops/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingViewPage extends StatelessWidget {
  const SettingViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اعدادات النظام")),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Get.to(() => AprtmentEilmentViewPage());
            },
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            title: Text("انواع التأجير"),
            subtitle: Text("اداره انواع التأجير "),
          ),
          Divider(
            color: Get.theme.colorScheme.primaryContainer,
            thickness: 0.5,
            endIndent: 16,
            indent: 16,
          ),
          ListTile(
            onTap: () {
              Get.to(() => JopsEilmentViewPage());
            },
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            title: Text("انواع الاعمال"),
            subtitle: Text("اداره انواع الاعمال "),
          ),
          Divider(
            color: Get.theme.colorScheme.primaryContainer,
            thickness: 0.5,
            endIndent: 16,
            indent: 16,
          ),
          ListTile(
            onTap: () {
              Get.to(() => GuaranteesEilmentViewPage());
            },
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            title: Text("انواع الضمانات"),
            subtitle: Text("اداره انواع الضمانات "),
          ),
        ],
      ),
    );
  }
}
