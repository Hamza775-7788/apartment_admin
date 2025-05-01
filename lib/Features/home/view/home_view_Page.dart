import 'package:apartment_admin/Features/home/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewModel.pages[viewModel.pageIndex],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: viewModel.pageIndex,
        onDestinationSelected: (index) {
          viewModel.onChange(index);
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.report,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Icon(
              Icons.report,
              color: Get.theme.colorScheme.primaryContainer,
            ),
            label: viewModel.reportLable,
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.handyman_outlined,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Icon(
              Icons.handyman_outlined,
              color: Get.theme.colorScheme.primaryContainer,
            ),
            label: viewModel.orderLable,
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.apartment,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Icon(
              Icons.apartment,
              color: Get.theme.colorScheme.primaryContainer,
            ),
            label: viewModel.apartmentLable,
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.settings,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Icon(
              Icons.settings,
              color: Get.theme.colorScheme.primaryContainer,
            ),
            label: viewModel.settingLable,
          ),
        ],
      ),
    );
  }
}
