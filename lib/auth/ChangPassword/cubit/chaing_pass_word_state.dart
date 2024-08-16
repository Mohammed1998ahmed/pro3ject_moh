part of 'chaing_pass_word_cubit.dart';

@immutable
sealed class ChaingPassWordState {}

final class ChaingPassWordInitial extends ChaingPassWordState {}

final class ChaingPassWordLoading extends ChaingPassWordState {}

final class ChaingPassWordSceccfully extends ChaingPassWordState {}

final class ChaingPassWordError extends ChaingPassWordState {}

final class ChaingPassWordChaingloading extends ChaingPassWordState {}
