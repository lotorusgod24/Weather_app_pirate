// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, unused_element, no_leading_underscores_for_local_identifiers, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app_pirate/models/model.dart';
import 'package:weather_app_pirate/screens/weather_screen.dart';

import '../service/data_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _dataService = DataService();
  final TextEditingController _bayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff67bba2),
      appBar: AppBar(
        backgroundColor: const Color(0xff56a387),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: const Text(
          "Разрази меня гром!",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: 185,
                child: TextField(
                  controller: _bayController,
                  decoration: InputDecoration(
                    hintText: 'На поиски порта!',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                sendData(context);
              },
              child: Text(
                'Попутного ветра!',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xff56a387),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendData(BuildContext context) async {
    final response = await _dataService.getWeather(_bayController.text);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(
          cityName: response.cityName,
          temperature: response.tempInfo.toString(),
          likeTemp: response.feelsLikeTemp.toString(),
          description: response.weatherInfo.description,
        ),
      ),
    );
  }
}
