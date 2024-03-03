import 'package:flutter/material.dart';

abstract class HomeEvent {}

abstract class CopyEvent {}

class GetHomeData extends HomeEvent {
  final String apiUrl;
  final BuildContext context;

  GetHomeData(this.context, {required this.apiUrl});
}
