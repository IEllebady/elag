class RequestModel {
  String? doctorID;
  String? patientID;
  String? status;


  RequestModel({this.patientID, this.doctorID, this.status,});
  // NamedConstructor => I will used it when i get Data from fireStore and save it on this model
  // refactoring map | json
  RequestModel.fromJson({required Map<String, dynamic> data}) {
    doctorID = data['doctor_id'];
    patientID= data['patient_id'];
    status= data['status'];
  }
  // TOJson  => I will used it when i want to  send data to cloud firestore ( Fields )
  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorID,
      'patient_id': patientID,
      'status': status,
    };
  }
}
