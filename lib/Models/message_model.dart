class MessageModel {
  String? date;
  String? senderID;
  //String? messageReceiverID;
  String? title;

  MessageModel(
      {required this.title, required this.date, required this.senderID});

  // refactoring map | json
  // Named Constructor to get message Data from FireStore
  MessageModel.fromJson({required Map<String, dynamic> data}) {
    title = data['title'];

    date = data['date'];
    senderID = data['senderID'];
    //messageReceiverID = data['messageReceiverID'];
  }

  // TOJson used it when i will sent data to fireStore
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'senderID': senderID,
      // 'messageReceiverID': messageReceiverID,
    };
  }
}
