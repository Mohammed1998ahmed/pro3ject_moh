class MyDataAuctionModel {
  String? message;
  List<Auctions>? auctions;
  bool? status;

  MyDataAuctionModel({this.message, this.auctions, this.status});

  MyDataAuctionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['auctions'] != null) {
      auctions = <Auctions>[];
      json['auctions'].forEach((v) {
        auctions!.add(new Auctions.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.auctions != null) {
      data['auctions'] = this.auctions!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Auctions {
  int? id;
  String? end;
  String? begin;
  String? limit;
  String? description;
  int? initialPrice;
  int? profileId;
  String? status;
  Horses? horses;
  Profile? profile;

  Auctions(
      {this.id,
      this.end,
      this.begin,
      this.limit,
      this.description,
      this.initialPrice,
      this.profileId,
      this.status,
      this.horses,
      this.profile});

  Auctions.fromJson(Map<String, dynamic> json) {
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
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
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
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
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

class Profile {
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? profile;

  Profile(
      {this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.profile});

  Profile.fromJson(Map<String, dynamic> json) {
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FName'] = this.fName;
    data['lName'] = this.lName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['profile'] = this.profile;
    return data;
  }
}
