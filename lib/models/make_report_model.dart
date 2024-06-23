class makeReportStudentResponse {
  String? message;
  Report? report;

  makeReportStudentResponse({this.message, this.report});

  makeReportStudentResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    report =
    json['report'] != null ?  Report.fromJson(json['report']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (report != null) {
      data['report'] = report!.toJson();
    }
    return data;
  }
}

class Report {
  String? content;
  String? type;
  String? date;
  Null? researchpoint;
  int? headId;
  int? studentId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Report(
      {this.content,
        this.type,
        this.date,
        this.researchpoint,
        this.headId,
        this.studentId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Report.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    type = json['type'];
    date = json['date'];
    researchpoint = json['researchpoint'];
    headId = json['head_id'];
    studentId = json['student_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['type'] = type;
    data['date'] = date;
    data['researchpoint'] = researchpoint;
    data['head_id'] = headId;
    data['student_id'] = studentId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class MakeReportStudent {
  Map<String , dynamic> ? content;
  String? type;
  String? date;

  MakeReportStudent({this.content, this.type, this.date});

  MakeReportStudent.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['type'] = type;
    data['date'] = date;
    return data;
  }
}