part of 'profile_dotors_cubit.dart';

@immutable
sealed class ProfileDotorsState {}

final class ProfileDotorsInitial extends ProfileDotorsState {}

final class ProfileDotorsLoading extends ProfileDotorsState {}

final class ProfileDotorsSeccessfuly extends ProfileDotorsState {}

final class ProfileDotorsError extends ProfileDotorsState {}
