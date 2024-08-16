class GetTimeClubModel {
  List<AvailableTimes>? availableTimes;
  bool? status;

  GetTimeClubModel({this.availableTimes, this.status});

  GetTimeClubModel.fromJson(Map<String, dynamic> json) {
    if (json['Available Times'] != null) {
      availableTimes = <AvailableTimes>[];
      json['Available Times'].forEach((v) {
        availableTimes!.add(new AvailableTimes.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.availableTimes != null) {
      data['Available Times'] =
          this.availableTimes!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class AvailableTimes {
  int? id;
  int? trainerId;
  int? bookingId;
  String? date;
  String? startTime;
  String? endTime;
  int? isAvailable;
  int? price;
  String? createdAt;
  String? updatedAt;

  AvailableTimes(
      {this.id,
      this.trainerId,
      this.bookingId,
      this.date,
      this.startTime,
      this.endTime,
      this.isAvailable,
      this.price,
      this.createdAt,
      this.updatedAt});

  AvailableTimes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainerId = json['trainer_id'];
    bookingId = json['booking_id'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isAvailable = json['is_available'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trainer_id'] = this.trainerId;
    data['booking_id'] = this.bookingId;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_available'] = this.isAvailable;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
