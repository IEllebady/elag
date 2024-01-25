import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elag/Models/exrecies_model.dart';
import 'package:elag/Models/user_model.dart';
import 'package:elag/constants/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  File? userImgFile;

  void getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      userImgFile = File(pickedImage.path);
      emit(UserImageSelectedSuccessState());
    } else {
      emit(FailedToGeUserImageSelectedState());
    }
  }

  Future<String> uploadImageToStorge() async {
    Reference imageRef =
        FirebaseStorage.instance.ref(basename(userImgFile!.path));
    await imageRef.putFile(userImgFile!);
    return await imageRef.getDownloadURL();
  }

  void register(
      {required String email,
      required String name,
      required String password,
      required String choose}) async {
    emit(RegisterLoadingState());
    try {
      if (choose == "Patient") {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user?.uid != null) {
          String imgUrl = await uploadImageToStorge();
          await sendPatientDataToFireStore(
              patientName: name,
              patientEmail: email,
              patientPassword: password,
              patientID: userCredential.user!.uid,
              patientUrl: imgUrl,
              chooseStatus: choose);
          emit(PatientCreatedSuccessState());
        }
      } else if (choose == "Therapist") {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user?.uid != null) {
          String imgUrl = await uploadImageToStorge();
          await sendTherabistDataToFireStore(
              therabistName: name,
              therabistEmail: email,
              therabistPassword: password,
              therabistID: userCredential.user!.uid,
              therabistUrl: imgUrl,
              chooseStatus: choose);
          emit(TherabistCreatedSuccessState());
        }
        //await uploadImageToStorge();
      }
    }
    //await uploadImageToStorge();
    on FirebaseException catch (e) {
      if (e.code == "email-already-in-use") {
        emit(FailedToCreateUserState(message: 'Email already in use'));
      }
      if (e.code == "weak-password") {
        emit(FailedToCreateUserState(message: 'Weak Password'));
      }
    }
  }

  Future<void> storeExerciseDataToFireStore(
      {required String exerciseName,
      required String exerciseBody,
      required String exerciseSteps}) async {
    String imgUrl = await uploadImageToStorge();

    ExerciseModel exerciseModel = ExerciseModel(
        title: exerciseName,
        body: exerciseBody,
        image: imgUrl,
        steps: exerciseSteps);
    try {
      await FirebaseFirestore.instance
          .collection('Exercise')
          .doc(exerciseModel.senderID)
          .set(exerciseModel.toJson());
      emit(SaveExerciseDataOnFirestoreSuccessState());
    } on FirebaseException {
      emit(FailedToSaveExerciseDataOnFirestoreState());
    }
  }

  Future<void> sendPatientDataToFireStore(
      {required String patientUrl,
      required String patientName,
      required String patientEmail,
      required String patientPassword,
      required String patientID,
      required String chooseStatus}) async {
    UserModel userModel = UserModel(
        name: patientName,
        email: patientEmail,
        image: patientUrl,
        id: patientID,
        chooseStatus: chooseStatus);
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(patientID)
          .set(userModel.toJson());
      //.set({'name': name, 'email': email, 'id': userID});
      // we can replace set with add by but remove docMethod to add collection in existing indexes
      emit(SavePatientDataOnFirestoreSuccessState());
    } on FirebaseException {
      emit(FailedToSaveUserDataOnFirestoreState());
    }
  }

  Future<void> sendTherabistDataToFireStore(
      {required String therabistUrl,
      required String therabistName,
      required String therabistEmail,
      required String therabistPassword,
      required String therabistID,
      required String chooseStatus}) async {
    UserModel userModel = UserModel(
        name: therabistName,
        email: therabistEmail,
        image: therabistUrl,
        id: therabistID,
        chooseStatus: chooseStatus);
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(therabistID)
          .set(userModel.toJson());
      emit(SaveTherapistDataOnFirestoreSuccessState());
    } on FirebaseException {
      emit(FailedToSaveUserDataOnFirestoreState());
    }
  }

  //
  void login({required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var patient = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user?.uid.toString())
          .get();
      var chooseStatus = patient.data()!['chooseStatus'];
      if ("Patient" == chooseStatus) {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('userID', userCredential.user!.uid);
        Constants.userID = sharedPref.getString('userID');
        emit(PatientLoginSuccessState());
      } else {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('userID', userCredential.user!.uid);
        Constants.userID = sharedPref.getString('userID');
        emit(TherapistLoginSuccessState());
      }
    } on FirebaseAuthException {
      emit(FailedToLoginState());
    }
  }
}
