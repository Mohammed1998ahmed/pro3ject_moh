class PosttAddInsuranceModel {
  String? message;
  TheInsurance? theInsurance;
  bool? status;

  PosttAddInsuranceModel({this.message, this.theInsurance, this.status});

  PosttAddInsuranceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    theInsurance = json['the insurance'] != null
        ? new TheInsurance.fromJson(json['the insurance'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.theInsurance != null) {
      data['the insurance'] = this.theInsurance!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class TheInsurance {
  String? insurance;
  String? auction;
  int? profileId;
  String? updatedAt;
  String? createdAt;
  int? id;

  TheInsurance(
      {this.insurance,
      this.auction,
      this.profileId,
      this.updatedAt,
      this.createdAt,
      this.id});

  TheInsurance.fromJson(Map<String, dynamic> json) {
    insurance = json['insurance'];
    auction = json['auction'];
    profileId = json['profile_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insurance'] = this.insurance;
    data['auction'] = this.auction;
    data['profile_id'] = this.profileId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
