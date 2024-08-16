part of 'add_auctions_cubit.dart';

sealed class AddAuctionsState {}

final class AddAuctionsInitial extends AddAuctionsState {}

final class AddAuctionsSelectColor extends AddAuctionsState {}

final class AddAuctionsSelectValue extends AddAuctionsState {}

final class AddAuctionsSelectGender extends AddAuctionsState {}

final class AddAuctionsLoading extends AddAuctionsState {}

final class AddAuctionsSeccecfluy extends AddAuctionsState {}

final class AddAuctionsError extends AddAuctionsState {}
