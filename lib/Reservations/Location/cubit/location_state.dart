part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSueccfuly extends LocationState {}

final class LocationError extends LocationState {}

final class LocationChaningLatLng extends LocationState {}
