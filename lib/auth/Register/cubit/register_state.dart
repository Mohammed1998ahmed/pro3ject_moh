part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSeccsfully extends RegisterState {}

final class RegisterError extends RegisterState {}

final class RegisterLoadingVerfetion extends RegisterState {}

final class RegisterSeccsfullyVerfetion extends RegisterState {}

final class RegisterErrorVerfetion extends RegisterState {}

final class RegisterSelectedValue extends RegisterState {}

final class RegisterSelectGender extends RegisterState {}

final class RegisterChangLoading extends RegisterState {}

final class RegisterImagePath extends RegisterState {}
