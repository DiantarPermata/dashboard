import 'package:dashboard/model/storage_detail_model_dashboard.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';

class StorageDetailsDashboard extends StatelessWidget {
  final List<StorageInfo> storageInfos;

  const StorageDetailsDashboard({Key? key, required this.storageInfos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundSecondaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage Details',
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CircularChart(),
          SizedBox(height: 20),
          ...storageInfos.map((info) => StorageInfoCard(info: info)).toList(),
        ],
      ),
    );
  }
}

class CircularChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: 0.29,
                  strokeWidth: 10,
                  backgroundColor: textColor,
                  valueColor: AlwaysStoppedAnimation<Color>(background),
                ),
              ),
            ),
            Center(
              child: Text(
                '29.1GB\nof 128GB',
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StorageInfoCard extends StatelessWidget {
  final StorageInfo info;

  const StorageInfoCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Color(info.colorValue),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              info.title,
              style: TextStyle(color: textColor),
            ),
          ),
          Text(info.fileCount, style: TextStyle(color: Colors.white60)),
          SizedBox(width: 10),
          Text(info.size, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
