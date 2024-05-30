import 'package:flutter/material.dart';
import 'package:dashboard/data%20copy/data/storage_detail_data_dashboard.dart';
import 'package:dashboard/pages/dashboard/widget/my_files_dashboard.dart';
import 'package:dashboard/pages/dashboard/widget/recent_files_dashboard.dart'; // Import the RecentFilesTable
import 'package:dashboard/pages/dashboard/widget/storage_details_dashboard.dart';
import 'package:dashboard/theme/color.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:dashboard/widgets/header_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Column(
        children: [
          const SizedBox(height: 18),
          HeaderWidget(),
          const SizedBox(height: 18),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Responsive(
                mobile: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyFileGrid(crossAxisCount: 2), // 2 columns for mobile
                      SizedBox(height: 20),
                      RecentFiles(),
                      SizedBox(height: 20),
                      StorageDetailsDashboard(storageInfos: storageInfos),
                    ],
                  ),
                ),
                tablet: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyFileGrid(crossAxisCount: 4), // 4 columns for tablet
                      SizedBox(height: 20),
                      RecentFiles(),
                      SizedBox(height: 20),
                      StorageDetailsDashboard(
                        storageInfos: storageInfos,
                      ),
                    ],
                  ),
                ),
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          MyFileGrid(
                              crossAxisCount: 4), // 4 columns for desktop
                          SizedBox(height: 20),
                          RecentFiles(),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: StorageDetailsDashboard(
                        storageInfos: storageInfos,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
