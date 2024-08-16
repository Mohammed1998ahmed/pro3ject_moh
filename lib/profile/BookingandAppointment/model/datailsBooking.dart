class DatailsBooking {
  String? message;
  Bookings? bookings;
  bool? status;

  DatailsBooking({this.message, this.bookings, this.status});

  DatailsBooking.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    bookings = json['bookings'] != null
        ? new Bookings.fromJson(json['bookings'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Bookings {
  int? bookingId;
  int? userId;
  int? clubId;
  String? clubName;
  String? clubImage;
  String? clubDescription;
  int? serviceId;
  String? serviceName;
  String? serviceImage;
  int? trainerId;
  String? trainerFName;
  String? trainerLName;
  String? trainerImage;
  int? bookingStatus;
  int? amount;
  List<TrainerTimesInfo>? trainerTimesInfo;

  Bookings(
      {this.bookingId,
      this.userId,
      this.clubId,
      this.clubName,
      this.clubImage,
      this.clubDescription,
      this.serviceId,
      this.serviceName,
      this.serviceImage,
      this.trainerId,
      this.trainerFName,
      this.trainerLName,
      this.trainerImage,
      this.bookingStatus,
      this.amount,
      this.trainerTimesInfo});

  Bookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    userId = json['user_id'];
    clubId = json['club_id'];
    clubName = json['club_name'];
    clubImage = json['club_image'];
    clubDescription = json['club_description'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceImage = json['service_image'];
    trainerId = json['trainer_id'];
    trainerFName = json['trainer_FName'];
    trainerLName = json['trainer_lName'];
    trainerImage = json['trainer_image'];
    bookingStatus = json['booking_status'];
    amount = json['amount'];
    if (json['trainerTimesInfo'] != null) {
      trainerTimesInfo = <TrainerTimesInfo>[];
      json['trainerTimesInfo'].forEach((v) {
        trainerTimesInfo!.add(new TrainerTimesInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['user_id'] = this.userId;
    data['club_id'] = this.clubId;
    data['club_name'] = this.clubName;
    data['club_image'] = this.clubImage;
    data['club_description'] = this.clubDescription;
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['service_image'] = this.serviceImage;
    data['trainer_id'] = this.trainerId;
    data['trainer_FName'] = this.trainerFName;
    data['trainer_lName'] = this.trainerLName;
    data['trainer_image'] = this.trainerImage;
    data['booking_status'] = this.bookingStatus;
    data['amount'] = this.amount;
    if (this.trainerTimesInfo != null) {
      data['trainerTimesInfo'] =
          this.trainerTimesInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrainerTimesInfo {
  int? trainerTimeID;
  String? bookingDate;
  String? startTime;
  String? endTime;

  TrainerTimesInfo(
      {this.trainerTimeID, this.bookingDate, this.startTime, this.endTime});

  TrainerTimesInfo.fromJson(Map<String, dynamic> json) {
    trainerTimeID = json['trainerTimeID'];
    bookingDate = json['booking_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trainerTimeID'] = this.trainerTimeID;
    data['booking_date'] = this.bookingDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
