part of 'hospatel_cubit.dart';

@immutable
sealed class HospatelState {}

final class HospatelInitial extends HospatelState {}

final class Hospatelloading extends HospatelState {}

final class HospatelSeccessfluy extends HospatelState {}

final class HospatelError extends HospatelState {}
