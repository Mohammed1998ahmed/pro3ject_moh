part of 'change_pass_word_cubit.dart';

@immutable
sealed class ChangePassWordState {}

final class ChangePassWordInitial extends ChangePassWordState {}

final class ChangePassWordCliekChange extends ChangePassWordState {}

final class ChangePassWordLoading extends ChangePassWordState {}

final class ChangePassWordSueccsufly extends ChangePassWordState {}

final class ChangePassWordError extends ChangePassWordState {}
