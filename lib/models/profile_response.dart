class ProfileResponse {
  Student? student;

  ProfileResponse({this.student});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (student != null) {
      data['student'] = student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? name;
  String? englishName;
  int? age;
  String? sSN;
  String? email;
  String? account;
  String? phone;
  String? nationality;
  String? religion;
  String? job;
  String? address;
  String? idea;
  String? type;
  String? degree;
  String? level;
  String? enrollmentPapers;
  String? originalBachelorsDegree;
  String? status;
  String? time;
  String? maritalStatus;
  String? gender;
  int? departmentId;
  String? createdAt;
  String? updatedAt;
  String? loginType;
  String? payment;
  String? generalexam;
  StudentPhotos? studentPhotos;

  Student({
    this.id,
    this.name,
    this.englishName,
    this.age,
    this.sSN,
    this.email,
    this.account,
    this.phone,
    this.nationality,
    this.religion,
    this.job,
    this.address,
    this.idea,
    this.type,
    this.degree,
    this.level,
    this.enrollmentPapers,
    this.originalBachelorsDegree,
    this.status,
    this.time,
    this.maritalStatus,
    this.gender,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
    this.loginType,
    this.payment,
    this.generalexam,
    this.studentPhotos,
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    englishName = json['english_name'];
    age = json['age'];
    sSN = json['SSN'];
    email = json['email'];
    account = json['account'];
    phone = json['phone'];
    nationality = json['nationality'];
    religion = json['religion'];
    job = json['job'];
    address = json['address'];
    idea = json['idea'];
    type = json['type'];
    degree = json['degree'];
    level = json['level'];
    enrollmentPapers = json['enrollment_papers'];
    originalBachelorsDegree = json['original_bachelors_degree'];
    status = json['status'];
    time = json['time'];
    maritalStatus = json['marital_status'];
    gender = json['gender'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    loginType = json['login_type'];
    payment = json['payment'];
    generalexam = json['generalexam'];
    studentPhotos = json['student_photos'] != null
        ? StudentPhotos.fromJson(json['student_photos'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['english_name'] = englishName;
    data['age'] = age;
    data['SSN'] = sSN;
    data['email'] = email;
    data['account'] = account;
    data['phone'] = phone;
    data['nationality'] = nationality;
    data['religion'] = religion;
    data['job'] = job;
    data['address'] = address;
    data['idea'] = idea;
    data['type'] = type;
    data['degree'] = degree;
    data['level'] = level;
    data['enrollment_papers'] = enrollmentPapers;
    data['original_bachelors_degree'] = originalBachelorsDegree;
    data['status'] = status;
    data['time'] = time;
    data['marital_status'] = maritalStatus;
    data['gender'] = gender;
    data['department_id'] = departmentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['login_type'] = loginType;
    data['payment'] = payment;
    data['generalexam'] = generalexam;
    if (studentPhotos != null) {
      data['student_photos'] = studentPhotos!.toJson();
    }
    return data;
  }
}

class StudentPhotos {
  int? id;
  int? studentId;
  String? enrollmentPapers;
  String? originalBachelorsDegree;
  String? createdAt;
  String? updatedAt;
  String? personalImage;

  StudentPhotos({
    this.id,
    this.studentId,
    this.enrollmentPapers,
    this.originalBachelorsDegree,
    this.createdAt,
    this.updatedAt,
    this.personalImage,
  });

  StudentPhotos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    enrollmentPapers = json['enrollment_papers'];
    originalBachelorsDegree = json['original_bachelors_degree'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    personalImage = json['personalImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['enrollment_papers'] = enrollmentPapers;
    data['original_bachelors_degree'] = originalBachelorsDegree;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['personalImage'] = personalImage;
    return data;
  }
}
