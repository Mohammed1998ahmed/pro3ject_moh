part of 'cours_booking_cubit.dart';

@immutable
sealed class CoursBookingState {}

final class CoursBookingInitial extends CoursBookingState {}

final class CoursBookingLoading extends CoursBookingState {}

final class CoursBookingSueccfuly extends CoursBookingState {}

final class CoursBookingError extends CoursBookingState {}

final class CoursBookingClassLoading extends CoursBookingState {}

final class CoursBookingClassSueccfuly extends CoursBookingState {}

final class CoursBookingClassError extends CoursBookingState {}

final class CoursBookingCoursBookingLoading extends CoursBookingState {}

final class CoursBookingCoursBookingSueccfuly extends CoursBookingState {}

final class CoursBookingCoursBookingError extends CoursBookingState {}

final class CoursBookingCoursBooking extends CoursBookingState {}

final class CoursBookingCoursBookingPymentOk extends CoursBookingState {}

final class CoursBookingCoursBookingPymentError extends CoursBookingState {}

final class MainScreenConfigPusheBookingEvent extends CoursBookingState {}

final class MainScreenConfigPusheBooking extends CoursBookingState {}

final class MainScreenConfigPusheBookingEvent1 extends CoursBookingState {}

final class MainScreenConfigPusheBooking1 extends CoursBookingState {}
