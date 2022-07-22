// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../models/model.dart';
import '../service/data_service.dart';

class WeatherScreen extends StatefulWidget {
  final String bayText;

  const WeatherScreen({required this.bayText});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextStyle _style = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  WeatherResponse? _response;

  final _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff67bba2),
      appBar: AppBar(
        backgroundColor: const Color(0xff56a387),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Тишина на палубе!',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 52.0, horizontal: 40),
            child: Container(
              height: 180,
              width: 320,
              decoration: BoxDecoration(
                color: Color(0xff56a387),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Порт: ${widget.bayText}',
                          style: _style,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Температура: ${_response?.tempInfo}',
                          style: _style,
                        ),
                        // SizedBox(height: 10),
                        // Text(
                        //   'Ощущается как: ${_response!.feelsLikeTemp}',
                        //   style: _style,
                        // ),
                        // SizedBox(height: 10),
                        // Text(
                        //   'Описание: ${_response!.weatherInfo.description}',
                        //   style: _style,
                        // ),
                        // SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: Image.asset('assets/FRBT_jIhVsI.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Image.asset(
              'assets/красивые-картинки-art-YY-H-старинные-корабли-4788481.jpeg'),
        ],
      ),
    );
  }

  void weatherInfo() async {
    final passText = widget.bayText;
    final response = await _dataService.getWeather(passText);

    setState(() {
      _response = response;
    });
  }
}
