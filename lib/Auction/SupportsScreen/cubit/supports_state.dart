part of 'supports_cubit.dart';

@immutable
sealed class SupportsState {}

final class SupportsInitial extends SupportsState {}

final class SupportsLoading extends SupportsState {}

final class SupportsSueccessfluy extends SupportsState {}

final class SupportsError extends SupportsState {}

final class SupportsChaingBoolean extends SupportsState {}
