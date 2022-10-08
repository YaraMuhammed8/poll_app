part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}
class ChangeCandidateState extends MainState {}
class SendVoteLoadingState extends MainState {}
class SendVoteSuccessState extends MainState {}
class SendVoteErrorState extends MainState {}