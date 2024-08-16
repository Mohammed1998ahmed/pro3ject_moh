sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSceccfully extends ChatState {}

final class ChatError extends ChatState {}

final class ChatShimmer extends ChatState {}

final class ChatGetLoading extends ChatState {}

final class ChatGetSceccfully extends ChatState {}

final class ChatGetError extends ChatState {}

final class ChatGetListDoctorLoading extends ChatState {}

final class ChatGetListDoctorSceccfully extends ChatState {}

final class ChatGetListDoctorError extends ChatState {}

final class ChatGetSceccfullyPUsher extends ChatState {}
