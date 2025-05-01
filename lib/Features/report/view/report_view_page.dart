import 'package:apartment_admin/Features/report/controller/report_controller.dart';
import 'package:apartment_admin/Features/report/viewModel/report_viewModel.dart';
import 'package:apartment_admin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReportViewPage extends StatefulWidget {
  const ReportViewPage({super.key});

  @override
  State<ReportViewPage> createState() => _ReportViewPageState();
}

class _ReportViewPageState extends State<ReportViewPage> {
  ReportViewmodel viewModel = ReportViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),

      body: GetBuilder<ReportController>(
        builder: (_) {
          return GridView.builder(
            itemCount: viewModel.reports.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.reports[index].name,
                      style: AppTextStyles.normaBoldlTitle(),
                    ),
                    SizedBox(height: 8),
                    Text(
                      viewModel.reports[index].count.toString(),
                      style: AppTextStyles.normalTitle2(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
