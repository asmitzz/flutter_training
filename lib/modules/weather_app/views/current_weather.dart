import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_training/modules/weather_app/models/weather_model.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  late Weather _weather;
  String cityName = "jabalpur";

  _onChanged(value) {
    cityName = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "City", hintText: "Enter city name"),
            onChanged: _onChanged,
          ),
          FutureBuilder(
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                _weather = snapshot.data;
                if (snapshot.hasError) {
                  return const Text("Error getting weather");
                } else {
                  return weatherBox(_weather);
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: getCurrentWeather(cityName),
          ),
        ],
      ),
    ));
  }
}

Widget weatherBox(Weather _weather) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Container(
        margin: const EdgeInsets.all(10.0),
        child: Text(
          _weather.cityName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
        )),
    Container(
        margin: const EdgeInsets.all(10.0),
        child: Text(
          "${_weather.temp}°C",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
        )),
    Container(
        margin: const EdgeInsets.all(5.0), child: Text(_weather.description)),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("Feels:${_weather.feelsLike}°C")),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("H:${_weather.high}°C L:${_weather.low}°C")),
  ]);
}

Future getCurrentWeather(String cityName) async {
  late Weather weather;
  String apiKey = "17cc0ba49361a4a0fe7db3bbe77e1ba9";

  String url =
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
    }
    return weather;
  } catch (e) {
    rethrow;
  }
}
