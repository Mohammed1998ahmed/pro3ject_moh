class GetTimeActionModel {
  int? daysLeft;
  int? hoursLeft;
  int? minutesLeft;

  GetTimeActionModel({this.daysLeft, this.hoursLeft, this.minutesLeft});

  GetTimeActionModel.fromJson(Map<String, dynamic> json) {
    daysLeft = json['days left : '];
    hoursLeft = json['hours left : '];
    minutesLeft = json['minutes left : '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days left : '] = this.daysLeft;
    data['hours left : '] = this.hoursLeft;
    data['minutes left : '] = this.minutesLeft;
    return data;
  }
}
