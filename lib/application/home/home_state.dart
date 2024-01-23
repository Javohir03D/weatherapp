// ignore_for_file: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wheather/infrastructure/model/weather_data.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) WeatherData? weather,
    @Default(-1) int selectIndex,
  }) = _HomeState;

  const HomeState._();
}
