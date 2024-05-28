import 'package:dashboard/data/storage_detail_data_dashboard.dart';
import 'package:dashboard/pages/dashboard/widget/my_files_dashboard.dart';
import 'package:dashboard/pages/dashboard/widget/recent_files_dashboard.dart'; // Import the RecentFilesTable
import 'package:dashboard/pages/dashboard/widget/storage_details_dashboard.dart';
import 'package:dashboard/theme/color.dart';
import 'package:dashboard/widgets/header_widget.dart';
import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'My Files',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              // Add new file action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  accentColor, // Set the button color to accentColor2
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            child: Text(
                              '+ Add New',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      MyFileGrid(),
                      SizedBox(height: 20),
                      RecentFiles()
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
        ],
      ),
    );
  }
}
