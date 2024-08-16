class AlloffersModel {
  String? message;
  List<Offers>? offers;
  bool? status;

  AlloffersModel({this.message, this.offers, this.status});

  AlloffersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Offers {
  int? id;
  int? offerValue;
  String? description;
  String? begin;
  String? end;
  int? healthCareId;
  String? image;
  String? name;

  Offers(
      {this.id,
      this.offerValue,
      this.description,
      this.begin,
      this.end,
      this.healthCareId,
      this.image,
      this.name});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerValue = json['offer_value'];
    description = json['description'];
    begin = json['begin'];
    end = json['end'];
    healthCareId = json['health_care_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['offer_value'] = this.offerValue;
    data['description'] = this.description;
    data['begin'] = this.begin;
    data['end'] = this.end;
    data['health_care_id'] = this.healthCareId;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
