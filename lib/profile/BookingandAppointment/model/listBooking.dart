class GetBookingListModel {
  String? message;
  List<Bookings>? bookings;
  bool? status;

  GetBookingListModel({this.message, this.bookings, this.status});

  GetBookingListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Bookings {
  int? bookingId;
  int? clubId;
  String? clubName;
  String? clubImage;
  String? clubDescription;

  Bookings(
      {this.bookingId,
      this.clubId,
      this.clubName,
      this.clubImage,
      this.clubDescription});

  Bookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    clubId = json['club_id'];
    clubName = json['club_name'];
    clubImage = json['club_image'];
    clubDescription = json['club_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['club_id'] = this.clubId;
    data['club_name'] = this.clubName;
    data['club_image'] = this.clubImage;
    data['club_description'] = this.clubDescription;
    return data;
  }
}
