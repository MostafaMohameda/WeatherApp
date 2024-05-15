

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/cubits/getWeather_cubits/getWeather_cubit.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Search City'),
     ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration:  InputDecoration(
              contentPadding:  EdgeInsets.symmetric(vertical: 30,horizontal: 6),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              border:OutlineInputBorder(
              ),
            ),
          ),
        ),
      ),
    );
  }
}
