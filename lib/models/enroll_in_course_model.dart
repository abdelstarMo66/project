class EnrollInCourseRequest {
  List<int>? courseIds;

  EnrollInCourseRequest({this.courseIds});

  EnrollInCourseRequest.fromJson(Map<String, dynamic> json) {
    courseIds = json['course_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_ids'] = this.courseIds;
    return data;
  }
}

class EnrollInCourseResponse {
  String? message;

  EnrollInCourseResponse({this.message});

  EnrollInCourseResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
