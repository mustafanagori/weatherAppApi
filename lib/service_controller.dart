import 'package:container/weather_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceController extends GetxController {
  String name = "Weather App";
  String apitoken =
      "c19623f5a7052a2cc19d87967ede5b93"; // Replace with your API Key

  RxString cityname = "".obs;
  RxString temperature = "".obs;
  RxString weatherCondition = "".obs;

  Future<void> fetchweather() async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=London&appid=$apitoken&units=metric');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(data);
        cityname.value = weatherModel.name!.toString();
        temperature.value = "${weatherModel.main!.temp.toString()}°C";
        weatherCondition.value = weatherModel.weather![0].description!;
        print("City: ${cityname.value}");
        print("Temperature: ${temperature.value}");
        print("Weather Condition: ${weatherCondition.value}");
        update();
      } else {
        print("Failed to fetch weather data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
