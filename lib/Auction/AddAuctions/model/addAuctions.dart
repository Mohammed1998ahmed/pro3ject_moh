class AddAuctions {
  String? message;
  Data? data;
  bool? status;

  AddAuctions({this.message, this.data, this.status});

  AddAuctions.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  Auction? auction;
  Horse? horse;

  Data({this.auction, this.horse});

  Data.fromJson(Map<String, dynamic> json) {
    auction =
        json['auction'] != null ? new Auction.fromJson(json['auction']) : null;
    horse = json['horse'] != null ? new Horse.fromJson(json['horse']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auction != null) {
      data['auction'] = this.auction!.toJson();
    }
    if (this.horse != null) {
      data['horse'] = this.horse!.toJson();
    }
    return data;
  }
}

class Auction {
  String? initialPrice;
  String? description;
  String? end;
  String? begin;
  String? limit;
  int? profileId;
  int? id;

  Auction(
      {this.initialPrice,
      this.description,
      this.end,
      this.begin,
      this.limit,
      this.profileId,
      this.id});

  Auction.fromJson(Map<String, dynamic> json) {
    initialPrice = json['initialPrice'];
    description = json['description'];
    end = json['end'];
    begin = json['begin'];
    limit = json['limit'];
    profileId = json['profile_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initialPrice'] = this.initialPrice;
    data['description'] = this.description;
    data['end'] = this.end;
    data['begin'] = this.begin;
    data['limit'] = this.limit;
    data['profile_id'] = this.profileId;
    data['id'] = this.id;
    return data;
  }
}

class Horse {
  String? name;
  String? category;
  String? address;
  String? color;
  String? birth;
  String? gender;
  int? auctionId;
  List<String>? images;
  String? video;
  int? id;

  Horse(
      {this.name,
      this.category,
      this.address,
      this.color,
      this.birth,
      this.gender,
      this.auctionId,
      this.images,
      this.video,
      this.id});

  Horse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    address = json['address'];
    color = json['color'];
    birth = json['birth'];
    gender = json['gender'];
    auctionId = json['auction_id'];
    images = json['images'].cast<String>();
    video = json['video'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['address'] = this.address;
    data['color'] = this.color;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['auction_id'] = this.auctionId;
    data['images'] = this.images;
    data['video'] = this.video;
    data['id'] = this.id;
    return data;
  }
}
