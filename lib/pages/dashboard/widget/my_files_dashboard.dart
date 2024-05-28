import 'package:dashboard/data/my_files_data_dashboard.dart';
import 'package:dashboard/model/my_files_model_dashboard.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';

class MyFileGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Tambahkan ini

      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      children: myFiles.map((file) => MyFileCard(file: file)).toList(),
    );
  }
}

class MyFileCard extends StatelessWidget {
  final MyFile file;

  const MyFileCard({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundSecondaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.folder, color: Color(file.colorValue), size: 40),
          SizedBox(height: 10),
          Text(
            file.title,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.7, // Example progress value
            color: Color(file.colorValue),
            backgroundColor: accentColor2,
          ),
          SizedBox(height: 10),
          Text(
            '${file.fileCount}\n${file.size}',
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
