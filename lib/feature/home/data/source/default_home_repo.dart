import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/repository/home_repo.dart';
import '../model/home_data_model.dart';

class DefaultHomeRepo extends HomeRepository {
  Dio dio;
  DefaultHomeRepo({
    required this.dio,
  });

  @override
  Future<HomeDataModel?> requestHomeData(String apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        var responseModel = HomeDataModel.fromJson(response.data);
        return responseModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}