import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Models/info_Weather.dart';
import 'package:weather/Models/info_Weather.dart';
import 'package:weather/cubits/getWeather_cubits/getWeather_cubit.dart';
import 'package:weather/main.dart';

import '../Models/info_Weather.dart';

class WeatherInfoView extends StatelessWidget {
  const WeatherInfoView({super.key, required this.weather});
final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    var weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeData(weatherModel.weatherCondition),
            getThemeData(weatherModel.weatherCondition)[300]!,
            getThemeData(weatherModel.weatherCondition)[50]!,
          ]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            Text(weatherModel.cityName,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('update at ${weatherModel.date.hour}:${weatherModel.date.hour}',style: TextStyle(fontSize: 25,),),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(height: 60,
                child:  Image.network('https:${weatherModel.image}')),
            Text(weatherModel.temp.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Column(
              children: [
                Text('maxTemp:${weatherModel.maxTemp.round()}',style: TextStyle(fontSize: 15),),
                Text('minTemp:${weatherModel.minTemp.round()}',style: TextStyle(fontSize: 15,),),
              ],
            ),
          ],),
          Text(weatherModel.weatherCondition,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
        ],),
      ),
    );
  }
}
