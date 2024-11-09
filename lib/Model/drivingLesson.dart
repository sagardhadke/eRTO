class DrivingLessons {
  String? id;
  String? level;
  String? name;
  String? description;

  DrivingLessons({this.id, this.level, this.name, this.description});

  DrivingLessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }

  static List<DrivingLessons>? ofDrivingLessons(List ofData) {
    return ofData.map((e) => DrivingLessons.fromJson(e)).toList();
  }
}
