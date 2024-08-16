class GetRevewListModel {
  List<Reviews>? reviews;
  bool? status;

  GetRevewListModel({this.reviews, this.status});

  GetRevewListModel.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Reviews {
  int? id;
  int? rating;
  String? review;
  int? healthCareId;
  int? profileId;
  String? createdAt;
  String? updatedAt;
  String? reviewTime;
  Profile? profile;

  Reviews(
      {this.id,
      this.rating,
      this.review,
      this.healthCareId,
      this.profileId,
      this.createdAt,
      this.updatedAt,
      this.reviewTime,
      this.profile});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    review = json['review'];
    healthCareId = json['health_care_id'];
    profileId = json['profile_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reviewTime = json['review_time'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['health_care_id'] = this.healthCareId;
    data['profile_id'] = this.profileId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['review_time'] = this.reviewTime;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
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
  String? createdAt;
  String? updatedAt;

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
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
