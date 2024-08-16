class User1 {
  String? message;
  Data? data;
  bool? status;

  User1({this.message, this.data, this.status});

  User1.fromJson(Map<String, dynamic> json) {
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
  String? token;
  User? user;
  Profile? profile;

  Data({this.token, this.user, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class User {
  String? mobile;
  String? email;
  String? type;
  String? valid;
  int? id;

  User({this.mobile, this.email, this.type, this.valid, this.id});

  User.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    valid = json['valid'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['type'] = this.type;
    data['valid'] = this.valid;
    data['id'] = this.id;
    return data;
  }
}

class Profile {
  String? fName;
  String? lName;
  String? birth;
  String? address;
  String? gender;
  String? profile;
  int? id;

  Profile(
      {this.fName,
      this.lName,
      this.birth,
      this.address,
      this.gender,
      this.profile,
      this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    fName = json['FName'];
    lName = json['LName'];
    birth = json['birth'];
    address = json['address'];
    gender = json['gender'];
    profile = json['profile'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FName'] = this.fName;
    data['LName'] = this.lName;
    data['birth'] = this.birth;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['profile'] = this.profile;
    data['id'] = this.id;
    return data;
  }
}
