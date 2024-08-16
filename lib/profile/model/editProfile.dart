// class ProfileEdit {
//   bool? status;
//   String? message;
//   Data? data;

//   ProfileEdit({this.status, this.message, this.data});

//   ProfileEdit.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;

//   Data(
//       {this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.image,
//       this.points,
//       this.credit,
//       this.token});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     image = json['image'];
//     points = json['points'];
//     credit = json['credit'];
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['image'] = this.image;
//     data['points'] = this.points;
//     data['credit'] = this.credit;
//     data['token'] = this.token;
//     return data;
//   }
// }
class UpdataModel {
  String? message;
  Profile? profile;
  bool? status;

  UpdataModel({this.message, this.profile, this.status});

  UpdataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Profile {
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? image;

  Profile(
      {this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.image});

  Profile.fromJson(Map<String, dynamic> json) {
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FName'] = this.fName;
    data['lName'] = this.lName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }
}

