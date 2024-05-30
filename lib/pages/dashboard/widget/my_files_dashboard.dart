import 'package:flutter/material.dart';
import 'package:dashboard/data%20copy/data/my_files_data_dashboard.dart';
import 'package:dashboard/data%20copy/models/my_files_model_dashboard.dart';
import 'package:dashboard/theme/color.dart';

class MyFileGrid extends StatelessWidget {
  final int crossAxisCount;

  const MyFileGrid({Key? key, required this.crossAxisCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemWidth =
            (constraints.maxWidth - (crossAxisCount - 1) * 16) / crossAxisCount;
        double itemHeight = itemWidth * 1.2;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: itemWidth / itemHeight,
          children: myFiles
              .map((file) => MyFileCard(file: file, itemWidth: itemWidth))
              .toList(),
        );
      },
    );
  }
}

class MyFileCard extends StatelessWidget {
  final MyFile file;
  final double itemWidth;

  const MyFileCard({Key? key, required this.file, required this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundSecondaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.folder,
              color: Color(file.colorValue), size: itemWidth * 0.2),
          SizedBox(height: 5),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                file.title,
                style: TextStyle(
                  color: textColor,
                  fontSize: itemWidth * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          LinearProgressIndicator(
            value: 0.7, // Example progress value
            color: Color(file.colorValue),
            backgroundColor: accentColor2,
          ),
          SizedBox(height: 5),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${file.fileCount}\n${file.size}',
                style: TextStyle(
                  color: textColor,
                  fontSize: itemWidth * 0.06,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
