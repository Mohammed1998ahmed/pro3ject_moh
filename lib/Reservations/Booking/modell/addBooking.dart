class AddBookingModel {
  String? message;
  Booking? booking;

  AddBookingModel({this.message, this.booking});

  AddBookingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    booking =
        json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}

class Booking {
  int? userId;
  int? serviceId;
  int? trainerId;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Booking(
      {this.userId,
      this.serviceId,
      this.trainerId,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id});

  Booking.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    serviceId = json['service_id'];
    trainerId = json['trainer_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['trainer_id'] = this.trainerId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
