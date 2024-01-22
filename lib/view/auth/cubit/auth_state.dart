part of 'auth_cubit.dart';

//@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class TherapistLoginSuccessState extends AuthState {}

//class UserLoginSuccessState extends AuthState {}

class PatientLoginSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class FailedToLoginState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class FailedToSaveUserDataOnFirestoreState extends AuthState {}

class FailedToSaveExerciseDataOnFirestoreState extends AuthState {}

class SavePatientDataOnFirestoreSuccessState extends AuthState {}

class SaveExerciseDataOnFirestoreSuccessState extends AuthState {}

class SaveTherapistDataOnFirestoreSuccessState extends AuthState {}

class UserImageSelectedSuccessState extends AuthState {}

class FailedToGeUserImageSelectedState extends AuthState {}

class PatientCreatedSuccessState extends AuthState {}

class TherabistCreatedSuccessState extends AuthState {}

class FailedToCreateUserState extends AuthState {
  String message;
  FailedToCreateUserState({required this.message});
}
