import 'package:collection/collection.dart';

class MsSample {
  int? id;
  String? title;
  MsSample({
    required this.id,
    required this.title,
  });

  MsSample.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  @override
  String toString() {
    return 'MsSample(id: $id, title: $title)';
  }

  @override
  bool operator ==(covariant MsSample other) {
    if (identical(this, other)) return true;
    return other.id == id && other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode;
  }
}

class MsSampleData {
  List<MsSample>? data;
  MsSampleData({
    required this.data,
  });

  MsSampleData.fromJson(List<dynamic> json) {
    data = json.map((item) => MsSample.fromJson(item)).toList();
  }
  @override
  String toString() {
    return 'MsSampleData(data: $data)';
  }

  @override
  bool operator ==(covariant MsSampleData other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return data.hashCode;
  }
}
