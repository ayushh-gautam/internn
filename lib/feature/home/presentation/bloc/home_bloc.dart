import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../../configs/routes/global_key.dart';
import '../../../../configs/routes/route.dart';
import '../../domain/repository/home_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;
  HomeBloc(
    this.homeRepository,
  ) : super(HomeInitState()) {
    on<GetHomeData>(getHomeData);
  }

  FutureOr<void> getHomeData(GetHomeData event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      var data = await homeRepository.requestHomeData(event.apiUrl);
      if (data != null) {
        gNavigator?.pushNamed(Routes.secondPage);
        // emit(HomeLoadedState(homeDataModel: data, itemCount: 1));
        for (var i = 0; i < 4; i++) {
          emit(HomeLoadedState(homeDataModel: data, itemCount: i));
          await Future.delayed(const Duration(seconds: 3));
        }
      } else {
        emit(HomeLoadingState());
      }
    } catch (e) {
      emit(HomeLoadingState());
    }
  }
}