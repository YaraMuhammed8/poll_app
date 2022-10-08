import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:poll_app/services/dio/dio_helper.dart';
import 'package:poll_app/services/dio/end_points.dart';
import 'package:poll_app/services/shared_preference/cache_helper.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  List<String> candidates = ["toooooooooooot", "lol", "haha"];
  int selectedCandidate = 0;
  void selectCandidate(int index) {
    selectedCandidate = index;
    emit(ChangeCandidateState());
  }

  void sendVote(String userName, String candidate) {
    emit(SendVoteLoadingState());
    DioHelper.postData(
            url: VOTE,
            data: {"user_name": userName, "choosed_name": candidate},
            token: CacheHelper.getData(key: "token"))
        .then((value) {
      print(value.data);
      emit(SendVoteSuccessState());
    }).catchError((error) {
      emit(SendVoteErrorState());
    });
  }
}