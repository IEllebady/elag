part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

class FilteredUsersSuccessState extends LayoutState {}

class FilteredPatientsSuccessState extends LayoutState {}

class ChangeSearchUserSuccessState extends LayoutState {}

class ChangeSearchTherapistSuccessState extends LayoutState {}

class SendMessageSuccessState extends LayoutState {}

class GetMessagesSuccessState extends LayoutState {}

class SuccessPatientSendMessageState extends LayoutState {}

class SuccessTherabistSendMessageState extends LayoutState {}

class ChangeSearchPatientSuccessState extends LayoutState {}

class SuccessGetPatientDataState extends LayoutState {}

class SuccessGetTherabistDataState extends LayoutState {}

class SuccessGetUsersDataState extends LayoutState {}

class FailedToGetMyDataState extends LayoutState {}

class SuccessGetPatientsState extends LayoutState {}

class SuccessGetUsersState extends LayoutState {}

class SuccesGetTherabistssState extends LayoutState {}

class GetPatientsLoadingState extends LayoutState {}

class GetUsersLoadingState extends LayoutState {}

class GetTherabistsLoadingState extends LayoutState {}

class FailedToGetUsersDataState extends LayoutState {}

class GetUsersDataSuccessState extends LayoutState {}

class SuccessPatientGetMessagesState extends LayoutState {}

class SuccessTherabistGetMessagesState extends LayoutState {}

class GetMessagesFailureState extends LayoutState {}

class GetMessagesLoadingState extends LayoutState {}

class GetExreciesLoadingState extends LayoutState {}

class FilterPatientForUserLoadingState extends LayoutState {}

class FilterPatientForUserSuccessState extends LayoutState {}

class FilterTherapistForUserLoadingState extends LayoutState {}

class FilterTherapistForUserSuccessState extends LayoutState {}

class SuccessRemoveExerciseMessageState extends LayoutState {}

class GetRequestDataLoadingState extends LayoutState {}
class GetRequestDataSuccessState extends LayoutState {}
class GetRequestDataFailureState extends LayoutState {}

class DoctorAcceptPatientLoadingState extends LayoutState {}
class DoctorAcceptPatientSuccessState extends LayoutState {}
class DoctorAcceptPatientFailureState extends LayoutState {}