part of 'reset_pass_word_cubit.dart';

@immutable
sealed class ResetPassWordState {}

final class ResetPassWordInitial extends ResetPassWordState {}

final class ResetPassWordChaingloading extends ResetPassWordState {}

final class ResetPassWordLoading1 extends ResetPassWordState {}

final class ResetPassWordSueccsfuly1 extends ResetPassWordState {}

final class ResetPassWordErorr1 extends ResetPassWordState {}
