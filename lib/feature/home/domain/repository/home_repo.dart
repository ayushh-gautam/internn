import '../../data/model/home_data_model.dart';

abstract class HomeRepository {
  Future<HomeDataModel?> requestHomeData(String apiUrl);
}