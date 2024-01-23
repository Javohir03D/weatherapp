import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheather/infrastructure/model/weather_data.dart';
import 'package:wheather/infrastructure/repository/get_info.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  getInfo() async {
    state = state.copyWith(isLoading: true);
    final WeatherData? weather = await GetInfo.getWeather();
    state = state.copyWith(isLoading: false, weather: weather);
  }

  change(int index) async {
      state = state.copyWith(selectIndex: state.selectIndex == index ? -1 : index);
  }
}
