part of 'favovrite_cubit.dart';

@immutable
sealed class FavovriteState {}

final class FavovriteInitial extends FavovriteState {}

final class FavovriteLoading extends FavovriteState {}

final class Favovritesueccsfuly extends FavovriteState {}

final class FavovriteError extends FavovriteState {}
