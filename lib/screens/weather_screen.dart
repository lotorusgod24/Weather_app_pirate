// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../models/model.dart';
import '../service/data_service.dart';

class WeatherScreen extends StatelessWidget {
  final TextStyle _style = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  final String cityName;
  final String temperature;
  final String likeTemp;
  final String description;

  WeatherScreen(
      {super.key,
      required this.cityName,
      required this.temperature,
      required this.likeTemp,
      required this.description});

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
      body: ListView(
        children: [
          Column(
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
                              'Порт: $cityName',
                              style: _style,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Температура: $temperature',
                              style: _style,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Ощущается как: $likeTemp',
                              style: _style,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Описание: $description',
                              style: _style,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          height: 70,
                          width: 70,
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
        ],
      ),
    );
  }
}
