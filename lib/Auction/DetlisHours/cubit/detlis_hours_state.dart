part of 'detlis_hours_cubit.dart';

@immutable
sealed class DetlisHoursState {}

final class DetlisHoursInitial extends DetlisHoursState {}

final class DetlisHoursChaingBooleanFav extends DetlisHoursState {}

final class DetlisHoursChaingIndexImageAppBar extends DetlisHoursState {}

final class DetlisHoursLoading extends DetlisHoursState {}

final class DetlisHoursSceccfuly extends DetlisHoursState {}

final class DetlisHoursError extends DetlisHoursState {}

final class FilterScreenTimeUpComingLoading extends DetlisHoursState {}

final class FilterScreenTimeUpComingSceccfuly extends DetlisHoursState {}

final class FilterScreenTimeUpComingError extends DetlisHoursState {}

final class FilterScreenTimeUpComingPayMentSceccfuly extends DetlisHoursState {
  final DetailsActionsID detailsActionsID;

  FilterScreenTimeUpComingPayMentSceccfuly({required this.detailsActionsID});
}

final class FilterScreenTimeUpComingPayMentError extends DetlisHoursState {}

final class DetlisHoursFavoiteAddLoading extends DetlisHoursState {}

final class DetlisHoursFavoiteAddSceccfuly extends DetlisHoursState {}

final class DetlisHoursFavoiteAddError extends DetlisHoursState {}

final class DetlisHoursFavoiteRemoveLoading extends DetlisHoursState {}

final class DetlisHoursFavoiteRemoveSceccfuly extends DetlisHoursState {}

final class DetlisHoursFavoiteRemoveError extends DetlisHoursState {}

final class DetlisHoursFavoiteLoading extends DetlisHoursState {}

final class DetlisHoursFavoiteSceccfuly extends DetlisHoursState {}

final class DetlisHoursFavoiteError extends DetlisHoursState {}

final class DetlisHoursPostAddInsuranceLoading extends DetlisHoursState {}

final class DetlisHoursFavoitePostAddInsuranceSceccfuly
    extends DetlisHoursState {}

final class DetlisHoursFavoitePostAddInsuranceError extends DetlisHoursState {}
