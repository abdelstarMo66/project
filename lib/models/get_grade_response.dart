class GetGradeResponse {
  int? id;
  int? studentId;
  int? courseId;
  String? grade;
  String? firstOrSecond;
  String? createdAt;
  String? updatedAt;

  GetGradeResponse(
      {this.id,
        this.studentId,
        this.courseId,
        this.grade,
        this.firstOrSecond,
        this.createdAt,
        this.updatedAt});

  GetGradeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    courseId = json['course_id'];
    grade = json['grade'];
    firstOrSecond = json['firstOrSecond'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['student_id'] = studentId;
    data['course_id'] = courseId;
    data['grade'] = grade;
    data['firstOrSecond'] = firstOrSecond;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
