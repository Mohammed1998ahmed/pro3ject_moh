// class CreateConsultationModel {
//   String? message;
//   Consultation? consultation;
//   bool? status;

//   CreateConsultationModel({this.message, this.consultation, this.status});

//   CreateConsultationModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     consultation = json['Consultation'] != null
//         ? new Consultation.fromJson(json['Consultation'])
//         : null;
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.consultation != null) {
//       data['Consultation'] = this.consultation!.toJson();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Consultation {
//   String? name;
//   String? age;
//   String? gender;
//   String? color;
//   String? content;
//   String? sentAt;
//   String? profileId;
//   String? healthCareId;
//   int? id;
//   Details? details;
//   List<String>? images;

//   Consultation(
//       {this.name,
//       this.age,
//       this.gender,
//       this.color,
//       this.content,
//       this.sentAt,
//       this.profileId,
//       this.healthCareId,
//       this.id,
//       this.details,
//       this.images});

//   Consultation.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     age = json['age'];
//     gender = json['gender'];
//     color = json['color'];
//     content = json['content'];
//     sentAt = json['sent_at'];
//     profileId = json['profile_id'];
//     healthCareId = json['health_care_id'];
//     id = json['id'];
//     details =
//         json['details'] != null ? new Details.fromJson(json['details']) : null;
//     images = json['images'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['age'] = this.age;
//     data['gender'] = this.gender;
//     data['color'] = this.color;
//     data['content'] = this.content;
//     data['sent_at'] = this.sentAt;
//     data['profile_id'] = this.profileId;
//     data['health_care_id'] = this.healthCareId;
//     data['id'] = this.id;
//     if (this.details != null) {
//       data['details'] = this.details!.toJson();
//     }
//     data['images'] = this.images;
//     return data;
//   }
// }

// class Details {
//   List<Vaccination>? vaccination;
//   List<Treatment>? treatment;
//   List<Medical>? medical;

//   Details({this.vaccination, this.treatment, this.medical});

//   Details.fromJson(Map<String, dynamic> json) {
//     if (json['vaccination'] != null) {
//       vaccination = <Vaccination>[];
//       json['vaccination'].forEach((v) {
//         vaccination!.add(new Vaccination.fromJson(v));
//       });
//     }
//     if (json['treatment'] != null) {
//       treatment = <Treatment>[];
//       json['treatment'].forEach((v) {
//         treatment!.add(new Treatment.fromJson(v));
//       });
//     }
//     if (json['medical'] != null) {
//       medical = <Medical>[];
//       json['medical'].forEach((v) {
//         medical!.add(new Medical.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.vaccination != null) {
//       data['vaccination'] = this.vaccination!.map((v) => v.toJson()).toList();
//     }
//     if (this.treatment != null) {
//       data['treatment'] = this.treatment!.map((v) => v.toJson()).toList();
//     }
//     if (this.medical != null) {
//       data['medical'] = this.medical!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Vaccination {
//   int? id;
//   String? details;
//   String? date;

//   Vaccination({this.id, this.details, this.date});

//   Vaccination.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     details = json['details'];
//     date = json['date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['details'] = this.details;
//     data['date'] = this.date;
//     return data;
//   }
// }
