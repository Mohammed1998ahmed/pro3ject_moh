part of 'auction_calender_cubit.dart';

@immutable
sealed class AuctionCalenderState {}

final class AuctionCalenderInitial extends AuctionCalenderState {}

final class AuctionCalenderChaingP1 extends AuctionCalenderState {}

final class AuctionCalenderChaingP2 extends AuctionCalenderState {}

final class AuctionCalenderChaingP3 extends AuctionCalenderState {}

final class AuctionCalenderOnButton extends AuctionCalenderState {}

final class AuctionCalenderTodayLoading extends AuctionCalenderState {}

final class AuctionCalenderTodaySceccfuly extends AuctionCalenderState {}

final class AuctionCalenderTodayError extends AuctionCalenderState {}

final class AuctionCalenderUpcomingLoading extends AuctionCalenderState {}

final class AuctionCalenderUpcomingSceccfuly extends AuctionCalenderState {}

final class AuctionCalenderUpcomingError extends AuctionCalenderState {}

final class MainScreenConfigPusheBookingEvent1 extends AuctionCalenderState {}

final class MainScreenConfigPusheBooking1 extends AuctionCalenderState {}
