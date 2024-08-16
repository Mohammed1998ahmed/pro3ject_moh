part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSueccfuly extends BookingState {}

final class BookingError extends BookingState {}

final class BookingCackLength extends BookingState {}

final class BookingDatailsLoading extends BookingState {}

final class BookingDatailsSueccfuly extends BookingState {
  final DatailsBooking? datailsBooking;

  BookingDatailsSueccfuly({required this.datailsBooking});
}

final class BookingDatailsError extends BookingState {}

final class BookingDeleteLoading extends BookingState {}

final class BookingDeleteSueccfuly extends BookingState {}

final class BookingDeleteError extends BookingState {}

final class BookingDeleteOneTimeLoading extends BookingState {}

final class BookingDeleteOneTimeSueccfuly extends BookingState {
  final DeleteOneTime? deleteOneTime;

  BookingDeleteOneTimeSueccfuly({required this.deleteOneTime});
}

final class BookingDeleteOneTimeError extends BookingState {}

final class BookingDeleteOneTimePOP extends BookingState {}

final class BookingCoursClubsLoading extends BookingState {}

final class BookingCoursClubsSueccfuly extends BookingState {}

final class BookingCoursClubsError extends BookingState {}

final class BookingListBookingCoursClubsLoading extends BookingState {}

final class BookingListBookingCoursClubsSueccfuly extends BookingState {}

final class BookingListBookingCoursClubsError extends BookingState {}

final class BookingDeleteCoursClubsLoading extends BookingState {}

final class BookingDeleteCoursClubsSueccfuly extends BookingState {}

final class BookingDeleteCoursClubsError extends BookingState {}
