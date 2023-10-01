/// courses : [{"course_name":"Cou","certificate_link":"https://www.example.com/course-a"}]

class Courses {
  Courses({
    this.courses,
  });

  Courses.fromJson(dynamic json) {
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses?.add(Course.fromJson(v));
      });
    }
  }

  List<Course>? courses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// course_name : "Cou"
/// certificate_link : "https://www.example.com/course-a"

class Course {
  Course({
    this.courseName,
    this.certificateLink,
  });

  Course.fromJson(dynamic json) {
    courseName = json['course_name'];
    certificateLink = json['certificate_link'];
  }

  String? courseName;
  String? certificateLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['course_name'] = courseName;
    map['certificate_link'] = certificateLink;
    return map;
  }
}
