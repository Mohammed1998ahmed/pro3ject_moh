part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class Searchloading extends SearchState {}

final class SearchSeccessfluy extends SearchState {}

final class SearchError extends SearchState {}

final class SearchBoolean extends SearchState {}

final class SearchBooleanLoading extends SearchState {}
