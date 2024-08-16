part of 'sort_by_cubit.dart';

@immutable
sealed class SortByState {}

final class SortByInitial extends SortByState {}

final class SortByStringButton extends SortByState {}
