
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Views/search%20weather_view.dart';

import '../category/noweather_view.dart';
import '../category/weather_view.dart';
import '../cubits/getWeather_cubits/getWeather_States.dart';
import '../cubits/getWeather_cubits/getWeather_cubit.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context){
            return SearchView();
            }
            ),);
          }, icon: Icon(Icons.search)),
        ],
      ),
      body:BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context,state) {
          if (state is WeatherInitialState) {
            return const NoWeatherView();
          }
          else if (state is WeatherLoadedState) {
            return  WeatherInfoView(weather: state.weatherModel,);
          }
          else{
            return const Text('opps there was an error');
          }
        },
      ),
    );
  }
}
