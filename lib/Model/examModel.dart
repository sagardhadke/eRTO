class ExamModel {
  String? id;
  String? catId;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? answer;

  ExamModel(
      {this.id,
      this.catId,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.answer});

  ExamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['question'] = this.question;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    data['option4'] = this.option4;
    data['answer'] = this.answer;
    return data;
  }

  static List<ExamModel>? ofExamModel(List ofData) {
    return ofData.map((e) => ExamModel.fromJson(e)).toList();
  }
}
