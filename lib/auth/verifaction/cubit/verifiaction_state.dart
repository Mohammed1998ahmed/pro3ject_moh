part of 'verifiaction_cubit.dart';

@immutable
sealed class VerifiactionState {}

final class VerifiactionInitial extends VerifiactionState {}

final class VerifiactionLoading extends VerifiactionState {}

final class VerifiactionSececcfully extends VerifiactionState {}

final class VerifiactionError extends VerifiactionState {}

final class VerifiactionChaingLoading extends VerifiactionState {}

final class VerifiactionTimeValue extends VerifiactionState {}

final class VerifiactionResendCodeLoading extends VerifiactionState {}

final class VerifiactionResendCodeSececcfully extends VerifiactionState {}

final class VerifiactionResendCodeError extends VerifiactionState {}
