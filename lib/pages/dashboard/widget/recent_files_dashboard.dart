import 'package:dashboard/data/recents_files_data_dashboard.dart';
import 'package:dashboard/model/recents_files_model_dashboard.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundSecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: textColor),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 16,
              columns: [
                DataColumn(
                  label: Text("File Name", style: TextStyle(color: textColor)),
                ),
                DataColumn(
                  label: Text("Date", style: TextStyle(color: textColor)),
                ),
                DataColumn(
                  label: Text("Size", style: TextStyle(color: textColor)),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(fileInfo.title!, style: TextStyle(color: textColor)),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!, style: TextStyle(color: textColor))),
      DataCell(Text(fileInfo.size!, style: TextStyle(color: textColor))),
    ],
  );
}
