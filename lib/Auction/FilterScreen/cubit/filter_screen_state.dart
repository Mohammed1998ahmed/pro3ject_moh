part of 'filter_screen_cubit.dart';

@immutable
sealed class FilterScreenState {}

final class FilterScreenInitial extends FilterScreenState {}

final class FilterScreenUpComingLoading extends FilterScreenState {}

final class FilterScreenUpComingSceccfuly extends FilterScreenState {}

final class FilterScreenUpComingError extends FilterScreenState {}

