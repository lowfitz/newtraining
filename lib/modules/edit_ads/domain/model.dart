import 'package:new_bussiness_app/modules/home/domain/home_model.dart';

class AdShowModel {
  Data? data;

  AdShowModel({this.data});

  AdShowModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? shortId;
  String? link;
  String? id;
  String? title;
  String? description;
  String? address;
  String? type;
  int? views;
  Categories? category;
  String? days;
  List<Images>? images;
  String? phone;
  String? whatsapp;
  String? details;
  String? status;

  Data(
      {this.shortId,
      this.link,
      this.id,
      this.title,
      this.description,
      this.address,
      this.type,
      this.views,
      this.category,
      this.days,
      this.images,
      this.phone,
      this.whatsapp,
      this.details,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    shortId = json['short_id'];
    link = json['link'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    type = json['type'];
    views = json['views'];
    category =
        json['category'] != null ? Categories.fromJson(json['category']) : null;
    days = json['days'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    details = json['details'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short_id'] = shortId;
    data['link'] = link;
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['type'] = type;
    data['views'] = views;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['days'] = days;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['phone'] = phone;
    data['whatsapp'] = whatsapp;
    data['details'] = details;
    data['status'] = status;
    return data;
  }
}

class Images {
  String? url;
  int? id;

  Images({this.url, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}
