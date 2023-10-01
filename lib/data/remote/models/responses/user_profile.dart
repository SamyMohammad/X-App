import 'package:x_app/data/remote/models/requests/Course.dart';

/// status_code : 200
/// message : "User Profile"
/// data : {"user_data":{"first_name":"Abdelaziz","middle_name":"Omar","last_name":"Abdelaziz","email":"abdelazizomar8512@gmail.com","role":"client","national_id":"29803050202396","birthday":"1998/03/05","government":"Alexandria","address":"SediBisher Qebli, 3a2l Basha Street","gender":"male","phone_number":"01027548498","faculty":"Faculty of scince","university":"Cairo University","specialization":"None","level":null,"educational_state":null,"image":"http://85.10.195.86/storage/images/dQHlk1zJGrt9pnyg6AAu8cNl3dVEbcw6gIrSiWf2.jpg","courses":[],"acceptance_rate":0,"rejection_rate":0,"ontime_rate":0}}

class UserProfile {
  UserProfile({
    this.statusCode,
    this.message,
    this.data,
  });

  UserProfile.fromJson(dynamic json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? MainData.fromJson(json['data']) : null;
  }

  num? statusCode;
  String? message;
  MainData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// user_data : {"first_name":"Abdelaziz","middle_name":"Omar","last_name":"Abdelaziz","email":"abdelazizomar8512@gmail.com","role":"client","national_id":"29803050202396","birthday":"1998/03/05","government":"Alexandria","address":"SediBisher Qebli, 3a2l Basha Street","gender":"male","phone_number":"01027548498","faculty":"Faculty of scince","university":"Cairo University","specialization":"None","level":null,"educational_state":null,"image":"http://85.10.195.86/storage/images/dQHlk1zJGrt9pnyg6AAu8cNl3dVEbcw6gIrSiWf2.jpg","courses":[],"acceptance_rate":0,"rejection_rate":0,"ontime_rate":0}

class MainData {
  MainData({
    this.userData,
  });

  MainData.fromJson(dynamic json) {
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }

  UserData? userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userData != null) {
      map['user_data'] = userData?.toJson();
    }
    return map;
  }
}

/// first_name : "Abdelaziz"
/// middle_name : "Omar"
/// last_name : "Abdelaziz"
/// email : "abdelazizomar8512@gmail.com"
/// role : "client"
/// national_id : "29803050202396"
/// birthday : "1998/03/05"
/// government : "Alexandria"
/// address : "SediBisher Qebli, 3a2l Basha Street"
/// gender : "male"
/// phone_number : "01027548498"
/// faculty : "Faculty of scince"
/// university : "Cairo University"
/// specialization : "None"
/// level : null
/// educational_state : null
/// image : "http://85.10.195.86/storage/images/dQHlk1zJGrt9pnyg6AAu8cNl3dVEbcw6gIrSiWf2.jpg"
/// courses : []
/// acceptance_rate : 0
/// rejection_rate : 0
/// ontime_rate : 0

class UserData {
  UserData({
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.role,
    this.nationalId,
    this.birthday,
    this.government,
    this.address,
    this.gender,
    this.phoneNumber,
    this.faculty,
    this.university,
    this.specialization,
    this.level,
    this.educationalState,
    this.image,
    this.courses,
    this.acceptanceRate,
    this.rejectionRate,
    this.ontimeRate,
  });

  UserData.fromJson(dynamic json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    nationalId = json['national_id'];
    birthday = json['birthday'];
    government = json['government'];
    address = json['address'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    faculty = json['faculty'];
    university = json['university'];
    specialization = json['specialization'];
    level = json['level'];
    educationalState = json['educational_state'];
    image = json['image'];
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses?.add(Course.fromJson(v));
      });
    }
    acceptanceRate = json['acceptance_rate'];
    jobCompleted = json['completed_rate'];
    totalIncome = json['total_income'];

    rejectionRate = json['rejection_rate'];
    ontimeRate = json['ontime_rate'];
  }

  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? role;
  String? nationalId;
  String? birthday;
  String? government;
  String? address;
  String? gender;
  String? phoneNumber;
  String? faculty;
  String? university;
  String? specialization;
  dynamic level;
  dynamic educationalState;
  String? image;
  List<Course>? courses;
  num? acceptanceRate;
  num? rejectionRate;
  num? ontimeRate;
  num? totalIncome;
  num? jobCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['middle_name'] = middleName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['role'] = role;
    map['national_id'] = nationalId;
    map['birthday'] = birthday;
    map['government'] = government;
    map['address'] = address;
    map['gender'] = gender;
    map['phone_number'] = phoneNumber;
    map['faculty'] = faculty;
    map['university'] = university;
    map['specialization'] = specialization;
    map['level'] = level;
    map['educational_state'] = educationalState;
    map['image'] = image;
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toJson()).toList();
    }
    map['acceptance_rate'] = acceptanceRate;
    map['rejection_rate'] = rejectionRate;
    map['ontime_rate'] = ontimeRate;
    map['completed_rate'] = jobCompleted;
    map['total_income'] = totalIncome;
    return map;
  }
}
