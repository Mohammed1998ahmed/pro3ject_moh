part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingServicLoading extends BookingState {}

final class BookingServicSuccsfuly extends BookingState {}

final class BookingServicError extends BookingState {}

final class BookingServicChickBox extends BookingState {}

final class BookingTrinnerChickBox extends BookingState {}

final class BookingServicID extends BookingState {}

final class BookingTrinnerID extends BookingState {}

final class BookingTrinnerLoading extends BookingState {}

final class BookingTrinnerSuccsfuly extends BookingState {}

final class BookingTrinnerError extends BookingState {}

final class BookingListTimeLoading extends BookingState {}

final class BookingListTimeSuccsfuly extends BookingState {}

final class BookingListTimeError extends BookingState {}

final class BookingBookingLoading extends BookingState {}

final class BookingBookingSuccsfuly extends BookingState {}

final class BookingBookingError extends BookingState {}

final class BookingBookingPaymentOk extends BookingState {}

final class BookingBookingPaymentError extends BookingState {}

final class BookingBookingPrice extends BookingState {}

final class MainScreenConfigPusheBookingEvent extends BookingState {}

final class MainScreenConfigPusheBooking extends BookingState {}

final class MainScreenConfigPusheBookingEvent1 extends BookingState {}

final class MainScreenConfigPusheBooking1 extends BookingState {}
