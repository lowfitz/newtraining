class AdsModel {
  List<AdsData>? data;

  AdsModel({this.data});

  AdsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AdsData>[];
      json['data'].forEach((v) {
        data!.add(AdsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdsData {
  String? shortId;
  String? id;
  String? cover;
  String? title;
  String? description;
  String? address;
  String? status;
  String? type;
  int? views;
  String? category;
  String? days;

  AdsData(
      {this.shortId,
      this.id,
      this.cover,
      this.title,
      this.description,
      this.address,
      this.status,
      this.type,
      this.views,
      this.category,
      this.days});

  AdsData.fromJson(Map<String, dynamic> json) {
    shortId = json['short_id'];
    id = json['id'];
    cover = json['cover'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    status = json['status'];
    type = json['type'];
    views = json['views'];
    category = json['category'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short_id'] = shortId;
    data['id'] = id;
    data['cover'] = cover;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['status'] = status;
    data['type'] = type;
    data['views'] = views;
    data['category'] = category;
    data['days'] = days;
    return data;
  }
}
