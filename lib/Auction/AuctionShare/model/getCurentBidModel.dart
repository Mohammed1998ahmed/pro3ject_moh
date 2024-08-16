class GetCurrntBidModel {
  String? cURRENTBID;
  OwnerOFBigBid? ownerOFBigBid;
  int? tHENEXTOFFER;

  GetCurrntBidModel({this.cURRENTBID, this.ownerOFBigBid, this.tHENEXTOFFER});

  GetCurrntBidModel.fromJson(Map<String, dynamic> json) {
    cURRENTBID = json['CURRENT BID : '];
    ownerOFBigBid = json['ownerOFBigBid'] != null
        ? new OwnerOFBigBid.fromJson(json['ownerOFBigBid'])
        : null;
    tHENEXTOFFER = json['THE NEXT OFFER : '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CURRENT BID : '] = this.cURRENTBID;
    if (this.ownerOFBigBid != null) {
      data['ownerOFBigBid'] = this.ownerOFBigBid!.toJson();
    }
    data['THE NEXT OFFER : '] = this.tHENEXTOFFER;
    return data;
  }
}

class OwnerOFBigBid {
  int? id;
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? profile;

  OwnerOFBigBid(
      {this.id,
      this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.profile});

  OwnerOFBigBid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    profile = json['profile'];
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
    return data;
  }
}
