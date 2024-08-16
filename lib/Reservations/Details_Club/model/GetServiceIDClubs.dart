class GetServicClubModel {
  List<Services>? services;
  bool? status;

  GetServicClubModel({this.services, this.status});

  GetServicClubModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Services {
  int? id;
  String? name;
  String? image;
  String? description;
  int? clubId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Services(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.clubId,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    clubId = json['club_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['club_id'] = this.clubId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
