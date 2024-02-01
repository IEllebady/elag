import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:elag/Models/exrecies_model.dart';
import 'package:elag/Models/message_model.dart';
import 'package:elag/Models/user_model.dart';
import 'package:elag/constants/constants.dart';

import '../../Models/request_model.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  UserModel? userModel;

  void getUsersData() async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(Constants.userID)
          .get()
          .then((value) {
        if (value.data() != null) {
          userModel = UserModel.fromJson(data: value.data()!);
        }
      });
      emit(SuccessGetUsersDataState());
    } on FirebaseException {
      emit(FailedToGetMyDataState());
    }
  }

  ExerciseModel? exerciseModel;
  List<RequestModel?>?patientRequestList;
  String? requestStatus;
  Future<void> getRequestValidation({required String doctorID}) async {
    emit(GetRequestDataLoadingState());
    RequestModel? requestModel=RequestModel();

    await FirebaseFirestore.instance
        .collection('Requests')
        .get()
        .then((QuerySnapshot querySnapshot) {
      requestStatus="";
      querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.id.contains(userModel!.id!+doctorID) ) {
          // Document ID contains the substring, you can access its data here
          print(documentSnapshot.data());
          requestModel= RequestModel.fromJson(data: documentSnapshot.data() as Map<String,dynamic>);
          requestStatus=requestModel!.status;
        }
        else if (documentSnapshot.id.contains(userModel!.id!) ) {
          // Document ID contains the substring, you can access its data here
        requestStatus="have doctor";
        }
      });
      print("legnth===");
      print(patientRequestList?.length);
      emit(GetRequestDataSuccessState());
    }).catchError((error) {
      // Handle any errors that occur
      print('Error getting requests: $error');
      emit(GetRequestDataFailureState());
    });
  }
  Future<void> getPatientRequestValidation({required String doctorID}) async {
    emit(GetRequestDataLoadingState());
    patientRequestList=[];
    RequestModel? requestModel=RequestModel();
    await FirebaseFirestore.instance
        .collection('Requests')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.id.contains(doctorID)) {
          // Document ID contains the substring, you can access its data here
          print(documentSnapshot.data());
          requestModel= RequestModel.fromJson(data: documentSnapshot.data() as Map<String,dynamic>);
          requestStatus=requestModel!.status;
          patientRequestList!.add(requestModel!);
          print(patientRequestList![0]?.patientID);
        }
      });
      print("legnth===");
      print(patientRequestList?.length);
      emit(GetRequestDataSuccessState());
    }).catchError((error) {
      // Handle any errors that occur
      print('Error getting requests: $error');
      emit(GetRequestDataFailureState());
    });
  }
  void getExreciesData() async {
    try {

      await FirebaseFirestore.instance
          .collection('Exercise')
          .doc(Constants.userID)
          .get()
          .then((value) {
        if (value.data() != null) {
          exerciseModel = ExerciseModel.fromJson(data: value.data()!);
        }
      });
      emit(SuccessGetUsersDataState());
    } on FirebaseException {
      emit(FailedToGetMyDataState());
    }
  }

  List<UserModel> users = [];

  void getUsers() async {
    users.clear();
    emit(GetUsersLoadingState());
    try {
      await FirebaseFirestore.instance.collection('Users').get().then((value) {
        for (var item in value.docs) {
          if (item.id != Constants.userID) {
            users.add(UserModel.fromJson(data: item.data()));
          }
        }
        emit(GetUsersDataSuccessState());
      });
    }
    // on FirebaseException
    catch (e) {
      users = [];
      emit(FailedToGetUsersDataState());
    }
  }

  List<ExerciseModel> exrecises = [];
  List<String> exercisesID = [];
  void getExreciesList() async {
    exrecises.clear();
    exercisesID.clear();
    emit(GetExreciesLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection('Exercise')
          .get()
          .then((value) {
        for (var item in value.docs) {
          if (item.id != Constants.exerciseID) {
            exercisesID.add(item.id);
            exrecises.add(ExerciseModel.fromJson(data: item.data()));
          }
        }
        emit(GetUsersDataSuccessState());
      });
    }
    //on FirebaseException
    catch (e) {
      exrecises = [];
      emit(FailedToGetUsersDataState());
    }
  }

  List<UserModel> patient = [];
  List<UserModel> patientPending = [];
  void getPatient() async{
    patient = [];
    patientPending=[];
    emit(FilterPatientForUserLoadingState());
    await getPatientRequestValidation(doctorID: userModel!.id!).then((value){
      FirebaseFirestore.instance
          .collection('Users')
          .where('chooseStatus', whereIn: ['Patient'])
          .get()
          .then((value)async {
        UserModel patientModel=UserModel();
        for (var element in value.docs) {
          final data = element.data();
          patientModel = UserModel.fromJson(data: data);
          print("patientRequestList= ${patientRequestList!.length}");
          for(var e in patientRequestList!){
            print("${e!.patientID}    and  ${patientModel.id}");
            if(e?.patientID==patientModel.id){
              if(e!.status=="accept"){
                patient.add(UserModel.fromJson(data: element.data()));
              }
              else if(e.status=="pending"){
                patientPending.add(UserModel.fromJson(data: element.data()));
              }
            }

          }
        }
        print(patientPending.length);
        emit(FilterPatientForUserSuccessState());
      });
    });
    // arrayContain will get all userName that contain input which user will type on textFormField

  }

  void doctorAcceptPatient(int index){

   emit(DoctorAcceptPatientLoadingState());
   RequestModel requestModel=RequestModel(doctorID: userModel!.id!,
   patientID: patientPending[index].id!,
     status: "accept"
   );
    FirebaseFirestore.instance
        .collection('Requests').doc(patientPending[index].id!+userModel!.id!).
    update(requestModel.toJson()).then((value) {
      patient.add(patientPending[index]);
      patientPending.removeAt(index);
      emit(DoctorAcceptPatientSuccessState());
    }).catchError((onError){
      print(onError);
      emit(DoctorAcceptPatientFailureState());
    });
  }

  void doctorRejectPatient(int index){
    emit(DoctorAcceptPatientLoadingState());
    // RequestModel requestModel=RequestModel(doctorID: userModel!.id!,
    //     patientID: patientPending[index].id!,
    //     status: "reject"
    // );
    FirebaseFirestore.instance
        .collection('Requests').doc(patientPending[index].id!+userModel!.id!).delete()
    // update(requestModel.toJson()).
    .then((value) {
      patientPending.removeAt(index);
      emit(DoctorAcceptPatientSuccessState());
    }).catchError((onError){
      print(onError);
      emit(DoctorAcceptPatientFailureState());
    });
  }

  List<UserModel> therapist = [];

  void getTherapist() {
    therapist = [];
    emit(FilterTherapistForUserLoadingState());
    // arrayContain will get all userName that contain input which user will type on textFormField
    FirebaseFirestore.instance
        .collection('Users')
        .where('chooseStatus', whereIn: ['Therapist'])
        .get()
        .then((value) {
          for (var element in value.docs) {
            therapist.add(UserModel.fromJson(data: element.data()));
            emit(FilterTherapistForUserSuccessState());
          }
        });
  }

  List<UserModel> usersFiltered = [];

  void searchAboutUser({required String query}) {
    usersFiltered = users
        .where((element) =>
            element.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    emit(FilteredUsersSuccessState());
  }

  List<UserModel> patientsFiltered = [];

  void searchAboutPatient({required String query}) {
    patientsFiltered = patient
        .where((element) =>
            element.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    emit(FilteredPatientsSuccessState());
  }

  List<UserModel> therapistsFiltered = [];

  void searchAboutTherapists({required String query}) {
    therapistsFiltered = therapist
        .where((element) =>
            element.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    emit(FilteredPatientsSuccessState());
  }

  List<ExerciseModel> exercisesFiltered = [];

  void searchAboutExercise({required String query}) {
    exercisesFiltered = exrecises
        .where((element) =>
            element.title!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    emit(FilteredPatientsSuccessState());
  }

  bool searchEnabled = false;

  void changeSearchStatus() {
    searchEnabled = !searchEnabled;
    if (searchEnabled == false) usersFiltered.clear();
    emit(ChangeSearchUserSuccessState());
  }

  bool searchTherapistEnabled = false;

  void changeSearchTherapistStatus() {
    searchTherapistEnabled = !searchTherapistEnabled;
    if (searchTherapistEnabled == false) therapistsFiltered.clear();
    emit(ChangeSearchTherapistSuccessState());
  }

  bool searchPatientEnabled = false;

  void changeSearchPatientStatus() {
    searchPatientEnabled = !searchPatientEnabled;
    if (searchPatientEnabled == false) patientsFiltered.clear();
    emit(ChangeSearchPatientSuccessState());
  }

  void sendMessage(
      {required String message, required String receiverID}) async {
    MessageModel messageModel = MessageModel(
        title: message,
        date: DateTime.now().toString(),
        senderID: Constants.userID);
    // Save Data on my Document
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(Constants.userID)
        .collection("Chat")
        .doc(receiverID)
        .collection("Messages")
        .add(messageModel.toJson());
    debugPrint("Message Sent success ......");
    // Save Data on Receiver Document
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(receiverID)
        .collection("Chat")
        .doc(Constants.userID)
        .collection("Messages")
        .add(messageModel.toJson());
    emit(SendMessageSuccessState());
  }

  List<MessageModel> messages = [];

  void getMessages({required String receiverID}) {
    emit(GetMessagesLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(Constants.userID)
        .collection('Chat')
        .doc(receiverID)
        .collection('Messages')
        .orderBy('date')
        .snapshots()
        .listen((value) {
      messages.clear();
      for (var item in value.docs) {
        messages.add(MessageModel.fromJson(data: item.data()));
      }
      debugPrint("Messages length is : ${messages.length}");
      emit(GetMessagesSuccessState());
    });
  }

  Future<void> deleteExerciseCollection(String receiverID) async {
    // Reference to the "Exercise" collection
    CollectionReference exerciseSenderCollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(Constants.userID)
        .collection("Chat")
        .doc(receiverID)
        .collection("Exercise");
    print("data");
    var snapshot=await exerciseSenderCollection.get();
    print("gert data");
    print(snapshot.docs.length);
    for(var doc in snapshot.docs){
      print(doc.data());
      await doc.reference.delete().then((value) {
        debugPrint("Exercise collection deleted successfully");
      }).catchError((onError){
        debugPrint(onError);
      });
    }

    CollectionReference exerciseReceiverCollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(receiverID)
        .collection("Chat")
        .doc(Constants.userID)
        .collection("Exercise");
    print("data");
    var snapshotReceiver=await exerciseReceiverCollection.get();
    print("gert data");
    print(snapshotReceiver.docs.length);
    for(var doc in snapshotReceiver.docs){
      await doc.reference.delete().then((value) {
        debugPrint("Exercise collection deleted successfully for receiver");
      }).catchError((onError){
        debugPrint(onError);
      });
    }
    // Retrieve all documents in the "Exercise" collection
    // QuerySnapshot querySnapshot = await exerciseCollection.get();
    // // Create a batch operation
    // WriteBatch batch = FirebaseFirestore.instance.batch();
    //
    // // Add delete operations for each document in the collection to the batch
    // querySnapshot.docs.forEach((DocumentSnapshot document) {
    //   batch.delete(document.reference);
    // });
    //
    // // Commit the batched operation to delete all documents in the collection
    // await batch.commit();
    // exerciseCollection.doc("0Pam1Ozvkfi51jcUFAhN").delete().then((value) {
    //   print("success");
    //
    // }).catchError((onError){
    //   print(onError);
    // });
    // Delete the "Exercise" collection
    // await exerciseCollection.parent!.delete().then((value){});
    // Print a debug message after successful deletion

    print("collection deleted successfully");
  }

  List<bool> isSelected = List.generate(9999999, (index) => false);
  void checkboxIsSelected(bool value,int index){
    isSelected[index] = value;
    emit(ChangeSearchPatientSuccessState());
  }
  void checkboxSelectedPrevious(){

  }
  void sendExercise(
      {required String title,
      required String receiverID,
      required String body,
      required String image,
        required int index,
      }) async {
    ExerciseModel exerciseModel = ExerciseModel(
        title: title,
        body: body,
        image: image,
        date: DateTime.now().toString(),
        senderID: Constants.userID);
    // Save Data on my Document
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(Constants.userID)
        .collection("Chat")
        .doc(receiverID)
        .collection("Exercise").doc(exercisesID[index]).set(exerciseModel.toJson());
        // .add(exerciseModel.toJson());
    debugPrint("Exercise Sent success ......");
    // Save Data on Receiver Document
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(receiverID)
        .collection("Chat")
        .doc(Constants.userID)
        .collection("Exercise")
        .add(exerciseModel.toJson());
    emit(SendMessageSuccessState());
  }

  List<ExerciseModel> exerciseMessage = [];

  void getExercise({required String receiverID}) {
    emit(GetMessagesLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(Constants.userID)
        .collection('Chat')
        .doc(receiverID)
        .collection('Exercise')
        .orderBy('date')
        .snapshots()
        .listen((value) {
      exerciseMessage.clear();
      for (var item in value.docs) {
        exerciseMessage.add(ExerciseModel.fromJson(data: item.data()));
        for(int i=0;i<exercisesID.length;i++){
          if(exercisesID[i]==item.id){
            isSelected[i]=true;
          }
        }
      }
      debugPrint("ExerciseModel length is : ${exerciseMessage.length}");
      emit(GetMessagesSuccessState());
    });

    //   void removeMessage(int index) {
    //   if (messages) {
    //     List<MessageModel> updatedMessages = List.from(messages);

    //     // Ensure the index is within the valid range
    //     if (index >= 0 && index < updatedMessages.length) {
    //     updatedMessages.removeAt(index);

    //       // Emit a new state with the updated list

    //     }
    //   }
    // }
  }

  void sendRequestToDoctor({required String doctorID}) {
    emit(GetMessagesLoadingState());
    RequestModel requestModel = RequestModel(
        status: "pending", patientID: Constants.userID, doctorID: doctorID);
    FirebaseFirestore.instance
        .collection('Requests')
        .doc(Constants.userID!+doctorID)
        .set(requestModel.toJson()).then((value) {
          print("added");
    });

    emit(GetMessagesSuccessState());
  }

  Future<void> _removeExerciseMessage(int index, String documentId) async {
    try {
      // Remove the item from Firestore
      await FirebaseFirestore.instance
          .collection(
              'your_collection_name') // Replace with your actual collection name
          .doc(documentId)
          .delete();

      // Remove the item from the local list
      exerciseMessage.removeAt(index);

      // Notify listeners about the state change
    } catch (e) {
      // Handle the error
      print("Error removing exercise message: $e");
    }
  }

//   void removeMessage(int index) {
//   if (messages) {
//     List<MessageModel> updatedMessages = List.from(messages);

//     // Ensure the index is within the valid range
//     if (index >= 0 && index < updatedMessages.length) {
//     updatedMessages.removeAt(index);

//       // Emit a new state with the updated list

//     }
//   }
// }
}

// Future<void> sendNotificationAfterJoinCommunity(
//     {required String receiverFirebaseMessagingToken,
//     required communityID,
//     required CommunityModel communityModel}) async {
//   await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"), headers: {
//     'Content-Type': "application/json",
//     // Todo: Authorization to know from App will send Notifications
//     'Authorization':
//         "key=AAAAZFCracs:APA91bFst8il3hmARx8In4PTVFBKePI2cM7JSob9wewr5rW-rkYjYlkQuikPJ9KEdUY0BH-t1eHsizKH2oprEbpEY47mYOAMzppjUbJsSyE6vWkMIoeKAUYohz9_L1oe7PR6p6hshsnc"
//   }, body: {
//     {
//       "to":
//           receiverFirebaseMessagingToken, // Todo: receiverFirebaseMessagingToken == firebase_messaging_token for community's author
//       "notification": {
//         "title": "New Follower",
//         "body":
//             "${userModel!.name!} start following your %${communityModel.communityName} Community",
//         "image": userModel!.image!,
//         "mutable_content": true,
//         "sound": "Tri-tone"
//       },
//       "data": {
//         "type":
//             "Notification after ${userModel!.name} followed your ${communityModel.communityName} community",
//         "senderName": userModel!.name!,
//         "senderID": userModel!.id!,
//         "communityID": communityID
//       }
//     }
//   });
// }
