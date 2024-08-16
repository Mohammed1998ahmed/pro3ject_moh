class GetFavoriteModel {
  List<FavoriteAuctions>? favoriteAuctions;
  bool? status;

  GetFavoriteModel({this.favoriteAuctions, this.status});

  GetFavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['favorite_auctions'] != null) {
      favoriteAuctions = <FavoriteAuctions>[];
      json['favorite_auctions'].forEach((v) {
        favoriteAuctions!.add(new FavoriteAuctions.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favoriteAuctions != null) {
      data['favorite_auctions'] =
          this.favoriteAuctions!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class FavoriteAuctions {
  int? id;
  String? end;
  String? begin;
  String? limit;
  String? description;
  int? initialPrice;
  int? profileId;
  String? status;
  Horses? horses;
  Pivot? pivot;

  FavoriteAuctions(
      {this.id,
      this.end,
      this.begin,
      this.limit,
      this.description,
      this.initialPrice,
      this.profileId,
      this.status,
      this.horses,
      this.pivot});

  FavoriteAuctions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    end = json['end'];
    begin = json['begin'];
    limit = json['limit'];
    description = json['description'];
    initialPrice = json['initialPrice'];
    profileId = json['profile_id'];
    status = json['status'];
    horses =
        json['horses'] != null ? new Horses.fromJson(json['horses']) : null;
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['end'] = this.end;
    data['begin'] = this.begin;
    data['limit'] = this.limit;
    data['description'] = this.description;
    data['initialPrice'] = this.initialPrice;
    data['profile_id'] = this.profileId;
    data['status'] = this.status;
    if (this.horses != null) {
      data['horses'] = this.horses!.toJson();
    }
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Horses {
  String? name;
  String? color;
  String? category;
  String? birth;
  String? gender;
  String? address;
  List<String>? images;
  int? auctionId;

  Horses(
      {this.name,
      this.color,
      this.category,
      this.birth,
      this.gender,
      this.address,
      this.images,
      this.auctionId});

  Horses.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
    category = json['category'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    images = json['images'].cast<String>();
    auctionId = json['auction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color'] = this.color;
    data['category'] = this.category;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['images'] = this.images;
    data['auction_id'] = this.auctionId;
    return data;
  }
}

class Pivot {
  int? userId;
  int? auctionId;

  Pivot({this.userId, this.auctionId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    auctionId = json['auction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['auction_id'] = this.auctionId;
    return data;
  }
}
