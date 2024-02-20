// ignore_for_file: public_member_api_docs, sort_constructors_first

class HomeModel {
  List<Categories>? categories;
  List<Ads>? ads;
  List<Slides>? slides;

  HomeModel({this.categories, this.ads, this.slides});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(Ads.fromJson(v));
      });
    }
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(Slides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (ads != null) {
      data['ads'] = ads!.map((v) => v.toJson()).toList();
    }
    if (slides != null) {
      data['slides'] = slides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? iconUrl;
  bool? isProject;

  Categories({this.id, this.name, this.iconUrl, this.isProject});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconUrl = json['icon_url'];
    isProject = json['is_project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon_url'] = iconUrl;
    data['is_project'] = isProject;
    return data;
  }

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ iconUrl.hashCode ^ isProject.hashCode;
  }
}

class Ads {
  String? shortId;
  String? id;
  String? cover;
  String? title;
  String? description;
  String? address;
  bool? isFavorite;
  String? type;
  int? views;
  String? category;
  String? price;
  String? days;
  dynamic media;
  String? whatsapp;
  int? postCategory;

  Ads(
      {this.shortId,
      this.id,
      this.cover,
      this.title,
      this.description,
      this.address,
      this.isFavorite,
      this.type,
      this.views,
      this.category,
      this.price,
      this.days,
      this.whatsapp,
      this.postCategory,
      this.media});

  Ads.fromJson(Map<String, dynamic> json) {
    shortId = json['short_id'];
    id = json['id'];
    cover = json['cover'];
    media = json['media'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    isFavorite = json['is_favorite'];
    type = json['type'];
    views = json['views'];
    category = json['category'];
    price = json['price'];
    whatsapp = json['whatsapp'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short_id'] = shortId;
    data['id'] = id;
    data['cover'] = cover;
    data['media'] = media;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['is_favorite'] = isFavorite;
    data['type'] = type;
    data['views'] = views;
    data['whatsapp'] = whatsapp;
    data['category'] = postCategory;
    data['price'] = price;
    data['days'] = days;
    return data;
  }
}

class Slides {
  String? image;

  Slides({this.image});

  Slides.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}
