import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          await Future.delayed(const Duration(seconds: 5));
        }
        showToast('Data fetched succesfully');
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text('Failed to fetch data.'),
          ),
        );
        emit(HomeErrorState());
      }
    } catch (e) {
      emit(HomeLoadingState());
    }
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 18,
  );
}
