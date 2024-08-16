class GetTrinnerClubModel {
  List<Trainers>? trainers;
  bool? status;

  GetTrinnerClubModel({this.trainers, this.status});

  GetTrinnerClubModel.fromJson(Map<String, dynamic> json) {
    if (json['Trainers'] != null) {
      trainers = <Trainers>[];
      json['Trainers'].forEach((v) {
        trainers!.add(new Trainers.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trainers != null) {
      data['Trainers'] = this.trainers!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Trainers {
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
  Pivot? pivot;

  Trainers(
      {this.fName,
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
      this.pivot});

  Trainers.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? serviceId;
  int? trainerId;

  Pivot({this.serviceId, this.trainerId});

  Pivot.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    trainerId = json['trainer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['trainer_id'] = this.trainerId;
    return data;
  }
}
