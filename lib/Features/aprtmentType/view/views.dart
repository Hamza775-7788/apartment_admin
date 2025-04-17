import 'package:apartment_admin/Features/aprtmentType/controller/apartment_type_controller.dart';
import 'package:apartment_admin/Features/aprtmentType/viewModel/viewModel.dart';
import 'package:apartment_admin/core/shared/buttons.dart';
import 'package:apartment_admin/core/shared/my_text_filed.dart';
import 'package:apartment_admin/core/shared/my_title_with_line_widget.dart';
import 'package:apartment_admin/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class AprtmentEilmentViewPage extends StatefulWidget {
  const AprtmentEilmentViewPage({super.key});

  @override
  State<AprtmentEilmentViewPage> createState() =>
      _AprtmentEilmentViewPageState();
}

class _AprtmentEilmentViewPageState extends State<AprtmentEilmentViewPage> {
  ApartmentElmentViewModel viewModel = ApartmentElmentViewModel();
  @override
  void initState() {
    viewModel.idController = TextEditingController();
    viewModel.nameArController = TextEditingController();
    viewModel.nameEnController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.idController.dispose();
    viewModel.nameArController.dispose();
    viewModel.nameEnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<ApartmentTypeControllerImpl>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: MyTextFiledWithLabel(
                          isEnebal: false,
                          hint: "",
                          controller: viewModel.idController,
                          label: viewModel.idLable,
                        ),
                      ),
                      Flexible(flex: 2, child: Container()),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 5)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    hint: "",
                    controller: viewModel.nameArController,
                    label: viewModel.nameLable,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 5)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    hint: "",
                    controller: viewModel.nameEnController,
                    label: viewModel.nameEnLable,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 5)),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyGenralButton(
                        name: viewModel.addLable,
                        onPressed: () {
                          viewModel.onAdd();
                        },
                      ),
                      MyGenralButton(
                        color: Colors.green.shade600,
                        name: viewModel.updateLable,
                        onPressed: () {
                          viewModel.onUpdate();
                        },
                      ),
                      MyGenralButton(
                        color: Get.theme.colorScheme.primaryContainer,
                        name: viewModel.clearLable,
                        onPressed: () {
                          viewModel.onClear();
                        },
                      ),
                      MyGenralButton(
                        color: redColor,
                        name: viewModel.deleteLable,
                        onPressed: () {
                          viewModel.onDelete(null);
                        },
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 5)),
                SliverToBoxAdapter(
                  child: MyTitleWithLineWidget(title: "السابق"),
                ),
                SliverList.builder(
                  itemCount: viewModel.types.length,
                  itemBuilder: (context, index) {
                    final elment = viewModel.types[index];
                    return ListTile(
                      onTap: () {
                        viewModel.onTap(elment);
                      },
                      contentPadding: EdgeInsets.all(0),
                      title: Text(elment.nameAr),
                      subtitle: Text(elment.nameEn),
                      trailing: IconButton(
                        onPressed: () {
                          viewModel.onDelete(elment.id);
                        },
                        icon: Icon(Icons.delete_outline, color: redColor),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
