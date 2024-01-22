class UserModel {
  String? name;
  String? image;
  String? email;
  String? id;
  String? chooseStatus;

  UserModel({this.name, this.email, this.id, this.image, this.chooseStatus});
  // NamedConstructor => I will used it when i get Data from fireStore and save it on this model
  // refactoring map | json
  UserModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    image = data['image'];
    id = data['id'];
    chooseStatus = data['chooseStatus'];
  }
  // TOJson  => I will used it when i want to  send data to cloud firestore ( Fields )
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'id': id,
      'chooseStatus': chooseStatus,
    };
  }
}
