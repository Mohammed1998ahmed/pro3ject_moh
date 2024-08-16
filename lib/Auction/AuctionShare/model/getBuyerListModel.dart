class GetBuyerListModel {
  List<Buyers>? buyers;
  bool? status;

  GetBuyerListModel({this.buyers, this.status});

  GetBuyerListModel.fromJson(Map<String, dynamic> json) {
    if (json['Buyers'] != null) {
      buyers = <Buyers>[];
      json['Buyers'].forEach((v) {
        buyers!.add(new Buyers.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buyers != null) {
      data['Buyers'] = this.buyers!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Buyers {
  int? id;
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? profile;
  List<Bids>? bids;

  Buyers(
      {this.id,
      this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.profile,
      this.bids});

  Buyers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    profile = json['profile'];
    if (json['bids'] != null) {
      bids = <Bids>[];
      json['bids'].forEach((v) {
        bids!.add(new Bids.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['FName'] = this.fName;
    data['lName'] = this.lName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['profile'] = this.profile;
    if (this.bids != null) {
      data['bids'] = this.bids!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bids {
  int? id;
  String? offeredPrice;
  int? profileId;
  int? auctionId;

  Bids({this.id, this.offeredPrice, this.profileId, this.auctionId});

  Bids.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offeredPrice = json['offeredPrice'];
    profileId = json['profile_id'];
    auctionId = json['auction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['offeredPrice'] = this.offeredPrice;
    data['profile_id'] = this.profileId;
    data['auction_id'] = this.auctionId;
    return data;
  }
}
