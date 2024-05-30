import 'package:dashboard/data%20copy/data/recents_files_data_dashboard.dart';
import 'package:dashboard/data%20copy/models/recents_files_model_dashboard.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                    ?.copyWith(color: textColor, fontSize: 14), // Perkecil ukuran teks
              ),
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: DataTable(
                      columnSpacing: constraints.maxWidth * 0.1, // Dinamis berdasarkan ukuran kontainer
                      columns: [
                        DataColumn(
                          label: Text("File Name",
                              style: TextStyle(color: textColor, fontSize: 12)), // Perkecil ukuran teks
                        ),
                        DataColumn(
                          label: Text("Date",
                              style: TextStyle(color: textColor, fontSize: 12)), // Perkecil ukuran teks
                        ),
                        DataColumn(
                          label: Text("Size",
                              style: TextStyle(color: textColor, fontSize: 12)), // Perkecil ukuran teks
                        ),
                      ],
                      rows: List.generate(
                        demoRecentFiles.length,
                        (index) => recentFileDataRow(demoRecentFiles[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
              height: 20,
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8), // Sesuaikan padding agar lebih kecil
              child: Text(fileInfo.title!, style: TextStyle(color: textColor, fontSize: 12)), // Perkecil ukuran teks
            ),
          ],
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8), // Sesuaikan padding agar lebih kecil
          child: Text(fileInfo.date!, style: TextStyle(color: textColor, fontSize: 12)),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8), // Sesuaikan padding agar lebih kecil
          child: Text(fileInfo.size!, style: TextStyle(color: textColor, fontSize: 12)),
        ),
      ),
    ],
  );
}
