part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSceccsufly extends FavoriteState {}

final class FavoriteError extends FavoriteState {}
final class MainScreenConfigPusheBookingEvent1 extends FavoriteState {}
final class MainScreenConfigPusheBooking1 extends FavoriteState {}



