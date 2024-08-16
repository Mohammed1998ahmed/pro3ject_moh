part of 'actions_share_cubit.dart';

@immutable
sealed class ActionsShareState {}

final class ActionsShareInitial extends ActionsShareState {}

final class ActionsShareAddBidLoading extends ActionsShareState {}

final class ActionsShareAddBidSeccesfuly extends ActionsShareState {}

final class ActionsShareAddBidErorr extends ActionsShareState {}

final class ActionsShareGetCurentBidLoading extends ActionsShareState {}

final class ActionsShareGetCurentBidSeccesfuly extends ActionsShareState {}

final class ActionsShareGetCurentBidErorr extends ActionsShareState {}

final class ActionsShareGetBuyerLoading extends ActionsShareState {}

final class ActionsShareGetBuyerSeccesfuly extends ActionsShareState {}

final class ActionsShareGetBuyerErorr extends ActionsShareState {}

final class MainScreenConfigPusheBookingEvent1 extends ActionsShareState {}

final class MainScreenConfigPusheBooking1 extends ActionsShareState {}
