class TestCategory {
  String? id;
  String? catName;
  String? description;
  String? catImage;

  TestCategory({this.id, this.catName, this.description, this.catImage});

  TestCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['cat_name'];
    description = json['description'];
    catImage = json['cat_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_name'] = this.catName;
    data['description'] = this.description;
    data['cat_image'] = this.catImage;
    return data;
  }

  static List<TestCategory>? ofTestCategory(List ofData) {
    return ofData.map((e) => TestCategory.fromJson(e)).toList();
  }
}
