// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import '../../data/model/home_data_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class CopyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeLoadedState extends HomeState {
  int itemCount;
  final HomeDataModel homeDataModel;
  HomeLoadedState({
    required this.itemCount,
    required this.homeDataModel,
  });
  @override
  List<Object?> get props => [homeDataModel, itemCount];
}
