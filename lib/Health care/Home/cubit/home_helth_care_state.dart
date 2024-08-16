part of 'home_helth_care_cubit.dart';

@immutable
sealed class HomeHelthCareState {}

final class HomeHelthCareInitial extends HomeHelthCareState {}

final class HomeHelthCareLoading extends HomeHelthCareState {}

final class HomeHelthCareSeccessfluy extends HomeHelthCareState {}

final class HomeHelthCareError extends HomeHelthCareState {}

final class HomeHelthCareOffersLoading extends HomeHelthCareState {}

final class HomeHelthCareOffersSeccessfluy extends HomeHelthCareState {}

final class HomeHelthCareOffersError extends HomeHelthCareState {}
