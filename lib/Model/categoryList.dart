class CategoryList {
  String? id;
  String? catName;
  String? description;
  String? catImage;

  CategoryList({this.id, this.catName, this.description, this.catImage});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    description = json["description"];
    catImage = json["cat_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["cat_name"] = catName;
    _data["description"] = description;
    _data["cat_image"] = catImage;
    return _data;
  }

  static List<CategoryList>? ofCategoryList(List ofData) {
    return ofData.map((e) => CategoryList.fromJson(e)).toList();
  }
}
