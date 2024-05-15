
import 'package:weather/Models/info_Weather.dart';

class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  WeatherModel weatherModel;
  WeatherLoadedState( this.weatherModel);
}
class WeatherFailureState extends WeatherState{
  final String errMessage;

  WeatherFailureState(this.errMessage);
}