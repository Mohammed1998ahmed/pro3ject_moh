class PostUpcomingActions {
  String? message;
  List<Auctions>? auctions;
  bool? status;

  PostUpcomingActions({this.message, this.auctions, this.status});

  PostUpcomingActions.fromJson(Map<String, dynamic> json) {
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
  String? end;
  String? begin;
  String? description;
  int? initialPrice;
  int? profileId;
  String? status;
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? image;
  int? userId;
  Horses? horses;

  Auctions(
      {this.end,
      this.begin,
      this.description,
      this.initialPrice,
      this.profileId,
      this.status,
      this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.image,
      this.userId,
      this.horses});

  Auctions.fromJson(Map<String, dynamic> json) {
    end = json['end'];
    begin = json['begin'];
    description = json['description'];
    initialPrice = json['initialPrice'];
    profileId = json['profile_id'];
    status = json['status'];
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    image = json['image'];
    userId = json['user_id'];
    horses =
        json['horses'] != null ? new Horses.fromJson(json['horses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end'] = this.end;
    data['begin'] = this.begin;
    data['description'] = this.description;
    data['initialPrice'] = this.initialPrice;
    data['profile_id'] = this.profileId;
    data['status'] = this.status;
    data['FName'] = this.fName;
    data['lName'] = this.lName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    if (this.horses != null) {
      data['horses'] = this.horses!.toJson();
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
