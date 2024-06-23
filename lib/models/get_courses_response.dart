class CoursesResponse {
  int? id;
  int? studentId;
  int? courseId;
  String? grade;
  String? firstOrSecond;
  String? createdAt;
  String? updatedAt;
  Course? course;

  CoursesResponse(
      {this.id,
      this.studentId,
      this.courseId,
      this.grade,
      this.firstOrSecond,
      this.createdAt,
      this.updatedAt,
      this.course});

  CoursesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    courseId = json['course_id'];
    grade = json['grade'];
    firstOrSecond = json['firstOrSecond'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['course_id'] = courseId;
    data['grade'] = grade;
    data['firstOrSecond'] = firstOrSecond;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}

class Course {
  int? id;
  String? code;
  String? name;
  String? hours;
  String? material;
  String? time;
  String? chose;
  String? createdAt;
  String? updatedAt;
  int? departmentId;

  Course(
      {this.id,
      this.code,
      this.name,
      this.hours,
      this.material,
      this.time,
      this.chose,
      this.createdAt,
      this.updatedAt,
      this.departmentId});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    hours = json['hours'];
    material = json['material'];
    time = json['time'];
    chose = json['chose'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['hours'] = hours;
    data['material'] = material;
    data['time'] = time;
    data['chose'] = chose;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['department_id'] = departmentId;
    return data;
  }
}
