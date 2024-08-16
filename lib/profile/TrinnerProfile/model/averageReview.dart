class AvarageReviewRating {
  int? averageRating;
  bool? status;

  AvarageReviewRating({this.averageRating, this.status});

  AvarageReviewRating.fromJson(Map<String, dynamic> json) {
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
