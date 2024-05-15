import 'package:dio/dio.dart';
import 'package:weather/Models/info_Weather.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'caf423ea484742299fa115126232010';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage=e.response?.data['error']['message']??
          'There error in code please Try later';
      throw Exception(errMessage);
    } catch(e){
      throw Exception('try later');
    }
    }
  }

