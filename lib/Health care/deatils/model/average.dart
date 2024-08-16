class GetAverageRevewModel {
  int? averageRating;
  bool? status;

  GetAverageRevewModel({this.averageRating, this.status});

  GetAverageRevewModel.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['averageRating'] = this.averageRating;
    data['status'] = this.status;
    return data;
  }
}
