class HealthCaresByIDModel {
  HealthCare? healthCare;
  bool? status;

  HealthCaresByIDModel({this.healthCare, this.status});

  HealthCaresByIDModel.fromJson(Map<String, dynamic> json) {
    healthCare = json['Health_Care'] != null
        ? new HealthCare.fromJson(json['Health_Care'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.healthCare != null) {
      data['Health_Care'] = this.healthCare!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class HealthCare {
  int? id;
  String? name;
  String? address;
  String? description;
  String? profileImage;
  String? license;
  String? website;
  String? lat;
  String? long;
  List<String>? day;
  String? start;
  String? end;
  int? userId;
  User? user;

  HealthCare(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.profileImage,
      this.license,
      this.website,
      this.lat,
      this.long,
      this.day,
      this.start,
      this.end,
      this.userId,
      this.user});

  HealthCare.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    profileImage = json['profile_image'];
    license = json['license'];
    website = json['website'];
    lat = json['lat'];
    long = json['long'];
    day = json['day'].cast<String>();
    start = json['start'];
    end = json['end'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['profile_image'] = this.profileImage;
    data['license'] = this.license;
    data['website'] = this.website;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    data['user_id'] = this.userId;
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
