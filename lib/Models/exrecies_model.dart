class ExerciseModel {
  String? title;
  String? image;
  String? body;
  String? steps;
  String? senderID;
  String? date;
  bool? isHidden;

  ExerciseModel(
      {this.title,
      this.body,
      this.senderID,
      this.image,
      this.date,
      this.steps,
      this.isHidden});

  // refactoring map | json
  ExerciseModel.fromJson({required Map<String, dynamic> data}) {
    title = data['title'];
    body = data['body'];
    image = data['image'];
    senderID = data['senderID'];
    date = data['date'];
    steps = data['steps'];
    isHidden = data['isHidden'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'image': image,
      'senderID': senderID,
      'date': date,
      'steps': steps,
      'isHidden': isHidden,
    };
  }
}
