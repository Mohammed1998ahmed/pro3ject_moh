part of 'neabry_screen_cubit.dart';

@immutable
sealed class NeabryScreenState {}

final class NeabryScreenInitial extends NeabryScreenState {}

final class NeabryScreenLoading extends NeabryScreenState {}

final class NeabryScreenSeccsfuly extends NeabryScreenState {}

final class NeabryScreenError extends NeabryScreenState {}
