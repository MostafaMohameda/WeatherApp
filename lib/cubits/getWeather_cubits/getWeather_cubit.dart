
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Models/info_Weather.dart';
import 'package:weather/cubits/getWeather_cubits/getWeather_States.dart';
import 'package:weather/service/service_info.dart';



class GetWeatherCubit extends Cubit<WeatherState >{
  GetWeatherCubit() : super(WeatherInitialState());
 WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
   try {
      weatherModel= await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
     emit(WeatherLoadedState( weatherModel!));
   }  catch (e) {
     emit(WeatherFailureState(e.toString()));
   }
  }

}