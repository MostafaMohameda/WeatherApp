import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeather_cubits/getWeather_States.dart';
import 'package:weather/cubits/getWeather_cubits/getWeather_cubit.dart';

import 'Views/myhome_View.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  GetWeatherCubit(),
      child: Builder(
        builder:(context)=> BlocBuilder<GetWeatherCubit,WeatherState>(
  builder: (context, state) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
             primarySwatch: getThemeData(
             BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition,
             ),
          ),
          home:const MyHomeView(),
        );
  },
),
      ),
    );
  }


}
MaterialColor getThemeData( condition){
  if(condition==null){
    return Colors.green;
  }
  switch(condition){
    case 'Sunny':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}