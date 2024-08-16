class SupportsModel {
  Support? support;
  bool? status;

  SupportsModel({this.support, this.status});

  SupportsModel.fromJson(Map<String, dynamic> json) {
    support =
        json['support'] != null ? new Support.fromJson(json['support']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Support {
  String? email;
  String? phoneNumber;
  String? message;
  int? id;

  Support({this.email, this.phoneNumber, this.message, this.id});

  Support.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phone_number'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['message'] = this.message;
    data['id'] = this.id;
    return data;
  }
}
