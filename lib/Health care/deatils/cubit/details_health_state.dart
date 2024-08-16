part of 'details_health_cubit.dart';

@immutable
sealed class DetailsHealthState {}

final class DetailsHealthInitial extends DetailsHealthState {}

final class HomeHelthCareByIDLoading extends DetailsHealthState {}

final class HomeHelthCareByIDSeccessfluy extends DetailsHealthState {}

final class HomeHelthCareByIDError extends DetailsHealthState {}

final class HomeHelthDoctorLoading extends DetailsHealthState {}

final class HomeHelthDoctorSeccessfluy extends DetailsHealthState {}

final class HomeHelthDoctorError extends DetailsHealthState {}

final class HomeHelthGetAllReviewLoading extends DetailsHealthState {}

final class HomeHelthGetAllReviewSeccessfluy extends DetailsHealthState {}

final class HomeHelthGetAllReviewError extends DetailsHealthState {}

final class HomeHelthPostChickReviewLoading extends DetailsHealthState {}

final class HomeHelthPostChickReviewSeccessfluy extends DetailsHealthState {}

final class HomeHelthPostChickReviewError extends DetailsHealthState {}

final class HomeHelthEverageLoading extends DetailsHealthState {}

final class HomeHelthEverageSeccessfluy extends DetailsHealthState {}

final class HomeHelthEverageReviewError extends DetailsHealthState {}

final class HomeHelthEverageReviewValueStar extends DetailsHealthState {}

final class HomeHelthUpdataLoading extends DetailsHealthState {}

final class HomeHelthUpdataSeccessfluy extends DetailsHealthState {}

final class HomeHelthUpdataError extends DetailsHealthState {}

final class HomeHelthPostReivewLoading extends DetailsHealthState {}

final class HomeHelthPostReivewSeccessfluy extends DetailsHealthState {}

final class HomeHelthPostReivewError extends DetailsHealthState {}

final class HomeHelthDeleteReivewLoading extends DetailsHealthState {}

final class HomeHelthDeleteReivewSeccessfluy extends DetailsHealthState {}

final class HomeHelthDeleteReivewError extends DetailsHealthState {}

final class HomeHelthRatingIDLoading extends DetailsHealthState {}

final class HomeHelthRatingIDSeccessfluy extends DetailsHealthState {}

final class HomeHelthRatingIDError extends DetailsHealthState {}

final class MainScreenConfigPusheBookingEvent1 extends DetailsHealthState {}

final class MainScreenConfigPusheBooking1 extends DetailsHealthState {}