class DetailsActionsID {
  Auction? auction;
  bool? status;

  DetailsActionsID({this.auction, this.status});

  DetailsActionsID.fromJson(Map<String, dynamic> json) {
    auction =
        json['auction'] != null ? new Auction.fromJson(json['auction']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auction != null) {
      data['auction'] = this.auction!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Auction {
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

  Auction(
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

  Auction.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? color;
  String? category;
  String? birth;
  String? gender;
  String? address;
  List<String>? images;
  int? auctionId;
  String? video;

  Horses(
      {this.id,
      this.name,
      this.color,
      this.category,
      this.birth,
      this.gender,
      this.address,
      this.images,
      this.auctionId,
      this.video});

  Horses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    category = json['category'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    images = json['images'].cast<String>();
    auctionId = json['auction_id'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['category'] = this.category;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['images'] = this.images;
    data['auction_id'] = this.auctionId;
    data['video'] = this.video;
    return data;
  }
}

class Profile {
  int? id;
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? profile;
  User? user;

  Profile(
      {this.id,
      this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.profile,
      this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    profile = json['profile'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? mobile;
  String? email;
  String? valid;
  String? type;
  String? verificationCode;
  String? resetToken;
  String? verificationCodeExpiresAt;
  String? resetTokenExpiresAt;
  String? emailVerifiedAt;

  User(
      {this.id,
      this.mobile,
      this.email,
      this.valid,
      this.type,
      this.verificationCode,
      this.resetToken,
      this.verificationCodeExpiresAt,
      this.resetTokenExpiresAt,
      this.emailVerifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    email = json['email'];
    valid = json['valid'];
    type = json['type'];
    verificationCode = json['verificationCode'];
    resetToken = json['resetToken'];
    verificationCodeExpiresAt = json['verification_code_expires_at'];
    resetTokenExpiresAt = json['reset_token_expires_at'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['valid'] = this.valid;
    data['type'] = this.type;
    data['verificationCode'] = this.verificationCode;
    data['resetToken'] = this.resetToken;
    data['verification_code_expires_at'] = this.verificationCodeExpiresAt;
    data['reset_token_expires_at'] = this.resetTokenExpiresAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}
