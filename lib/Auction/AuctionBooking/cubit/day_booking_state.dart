part of 'day_booking_cubit.dart';

@immutable
sealed class DayBookingState {}

final class DayBookingInitial extends DayBookingState {}

final class DayBookingLoading extends DayBookingState {}

final class DayBookingSeccsefuly extends DayBookingState {}

final class DayBookingError extends DayBookingState {}
