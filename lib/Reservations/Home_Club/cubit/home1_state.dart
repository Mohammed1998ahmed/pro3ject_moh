part of 'home1_cubit.dart';

@immutable
sealed class Home1State {}

final class Home1Initial extends Home1State {}

final class Home1LoadingSearch extends Home1State {}

final class Home1SceccfullySearch extends Home1State {}

final class Home1ErrorSearch extends Home1State {}

final class Home1ChaingLoading extends Home1State {}

final class Home1ChaingBoolean extends Home1State {}

final class Home1ListClubLoading extends Home1State {}

final class Home1ListClubSueccsufuly extends Home1State {}

final class Home1ListClubError extends Home1State {}

final class Home1SearchClubLoading extends Home1State {}

final class Home1SearchClubSueccsufuly extends Home1State {}

final class Home1SearchClubError extends Home1State {}

final class HomeCategoriesClubLoading extends Home1State {}

final class HomeCategoriesClubSueccsufuly extends Home1State {}

final class HomeCategoriesClubError extends Home1State {}

final class HomeCategoriesClubSueccsufulyPusher extends Home1State {}

final class Home1ListClubBooleanSearch extends Home1State {}

final class HomeOffersClubLoading extends Home1State {}

final class HomeOffersClubSueccsufuly extends Home1State {}

final class HomeOffersClubError extends Home1State {}
