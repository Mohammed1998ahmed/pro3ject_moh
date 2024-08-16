class HealthCaresModel {
  List<HealthCares>? healthCares;
  bool? status;

  HealthCaresModel({this.healthCares, this.status});

  HealthCaresModel.fromJson(Map<String, dynamic> json) {
    if (json['HealthCares'] != null) {
      healthCares = <HealthCares>[];
      json['HealthCares'].forEach((v) {
        healthCares!.add(new HealthCares.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.healthCares != null) {
      data['HealthCares'] = this.healthCares!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class HealthCares {
  int? id;
  String? name;
  String? profileImage;
  String? description;

  HealthCares({this.id, this.name, this.profileImage, this.description});

  HealthCares.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImage = json['profile_image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['description'] = this.description;
    return data;
  }
}
