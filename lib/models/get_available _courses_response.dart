class AvailableCourses {
  int ? id;
  String ? code;
  String? name;
  String? hours;
  String? material;
  String? time;
  String? chose;
  String? created_at;
  String? updated_at;
  int? department_id;

  AvailableCourses({
    this.id,
    this.code,
    this.name,
    this.hours,
    this.material,
    this.time,
    this.chose,
    this.created_at,
    this.updated_at,
    this.department_id,
  });

  AvailableCourses.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    hours = json['hours'];
    material = json['material'];
    time = json['time'];
    chose = json['chose'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    department_id = json['department_id'];
  }
}
