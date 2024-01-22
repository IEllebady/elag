import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:elag/Models/exrecies_model.dart';
import 'package:elag/Models/message_model.dart';
import 'package:elag/Models/user_model.dart';
import 'package:elag/constants/constants.dart';

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
  void getExreciesList() async {
    exrecises.clear();
    emit(GetExreciesLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection('Exercise')
          .get()
          .then((value) {
        for (var item in value.docs) {
          if (item.id != Constants.exerciseID) {
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
  void getPatient() {
    patient = [];
    emit(FilterPatientForUserLoadingState());
    // arrayContain will get all userName that contain input which user will type on textFormField
    FirebaseFirestore.instance
        .collection('Users')
        .where('chooseStatus', whereIn: ['Patient'])
        .get()
        .then((value) {
          for (var element in value.docs) {
            patient.add(UserModel.fromJson(data: element.data()));
            emit(FilterPatientForUserSuccessState());
          }
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

  void sendExercise(
      {required String title,
      required String receiverID,
      required String body,
      required String image}) async {
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
        .collection("Exercise")
        .add(exerciseModel.toJson());
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
      }
      debugPrint("ExerciseModel length is : ${exerciseMessage.length}");
      emit(GetMessagesSuccessState());
    });
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
