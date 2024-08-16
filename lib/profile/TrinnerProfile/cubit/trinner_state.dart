part of 'trinner_cubit.dart';

@immutable
sealed class TrinnerState {}

final class TrinnerInitial extends TrinnerState {}

final class TrinnerCreatLoading extends TrinnerState {}

final class TrinnerCreatSeccefuly extends TrinnerState {}

final class TrinnerCreatError extends TrinnerState {}

final class TrinnerAverageLoading extends TrinnerState {}

final class TrinnerAverageSeccefuly extends TrinnerState {}

final class TrinnerAverageError extends TrinnerState {}

final class TrinnerAllReviewTrinnerLoading extends TrinnerState {}

final class TrinnerAllReviewTrinnerSeccefuly extends TrinnerState {}

final class TrinnerAllReviewTrinnerError extends TrinnerState {}

final class TrinnerIsReservitionLoading extends TrinnerState {}

final class TrinnerIsReservitionSeccefuly extends TrinnerState {}

final class TrinnerIsReservitionError extends TrinnerState {}

final class TrinnerRating extends TrinnerState {}

final class TrinnerDeleteLoading extends TrinnerState {}

final class TrinnerDeleteSeccefuly extends TrinnerState {}

final class TrinnerDeleteError extends TrinnerState {}

final class TrinnerUserHasReviewInTrainerLoading extends TrinnerState {}

final class TrinnerUserHasReviewInTrainerSeccefuly extends TrinnerState {}

final class TrinnerUserHasReviewInTrainerError extends TrinnerState {}

final class TrinnerUpdataReviewLoading extends TrinnerState {}

final class TrinnerUpdataReviewSeccefuly extends TrinnerState {}

final class TrinnerUpdataReviewError extends TrinnerState {}

final class TrinnerRatingIDLoading extends TrinnerState {}

final class TrinnerRatingIDSeccefuly extends TrinnerState {}

final class TrinnerRatingIDError extends TrinnerState {}
