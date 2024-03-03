abstract class HomeEvent {}

class GetHomeData extends HomeEvent {
  final String apiUrl;

  GetHomeData({required this.apiUrl});
}