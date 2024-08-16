class MyClubTrenerIDModel {
  String? message;
  List<Trainers>? trainers;
  bool? status;

  MyClubTrenerIDModel({this.message, this.trainers, this.status});

  MyClubTrenerIDModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['trainers'] != null) {
      trainers = <Trainers>[];
      json['trainers'].forEach((v) {
        trainers!.add(new Trainers.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.trainers != null) {
      data['trainers'] = this.trainers!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Trainers {
  int? id;
  String? fName;
  String? lName;
  String? birth;
  String? gender;
  String? address;
  String? channelName;
  String? license;
  String? image;
  String? qualifications;
  String? certifications;
  int? experience;
  String? specialties;
  int? userId;
  int? clubId;
  List<String>? days;
  String? start;
  String? end;
  List<String>? images;

  Trainers(
      {this.id,
      this.fName,
      this.lName,
      this.birth,
      this.gender,
      this.address,
      this.channelName,
      this.license,
      this.image,
      this.qualifications,
      this.certifications,
      this.experience,
      this.specialties,
      this.userId,
      this.clubId,
      this.days,
      this.start,
      this.end,
      this.images});

  Trainers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['FName'];
    lName = json['lName'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    channelName = json['channelName'];
    license = json['license'];
    image = json['image'];
    qualifications = json['qualifications'];
    certifications = json['certifications'];
    experience = json['experience'];
    specialties = json['specialties'];
    userId = json['user_id'];
    clubId = json['club_id'];
    days = json['days'].cast<String>();
    start = json['start'];
    end = json['end'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['FName'] = this.fName;
    data['lName'] = this.lName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['channelName'] = this.channelName;
    data['license'] = this.license;
    data['image'] = this.image;
    data['qualifications'] = this.qualifications;
    data['certifications'] = this.certifications;
    data['experience'] = this.experience;
    data['specialties'] = this.specialties;
    data['user_id'] = this.userId;
    data['club_id'] = this.clubId;
    data['days'] = this.days;
    data['start'] = this.start;
    data['end'] = this.end;
    data['images'] = this.images;
    return data;
  }
}
