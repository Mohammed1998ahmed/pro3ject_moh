part of 'verternaty_cubit.dart';

sealed class VerternatyState {}

final class VerternatyInitial extends VerternatyState {}

final class VerternatySelectValue extends VerternatyState {}

final class VerternatySelectGender extends VerternatyState {}

final class VerternatySelectColor extends VerternatyState {}

final class VerternatyCreateLoading extends VerternatyState {}

final class VerternatyCreateSeccesssfluy extends VerternatyState {}

final class VerternatyCreateError extends VerternatyState {}
final class VerternatyChangLoading extends VerternatyState {}

