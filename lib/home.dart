import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:container/service_controller.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ServiceController serviceController = Get.put(ServiceController());

  @override
  void initState() {
    super.initState();
    serviceController.fetchweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              serviceController.fetchweather();
            },
            icon: const Icon(Icons.refresh ),
          )
        ],
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            //lotties 
            Lottie.asset('assets/weather.json'),

            // wether
             Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Text(
              "City: ${serviceController.name}",
              style: const TextStyle(
                  color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Temperature: ${serviceController.temperature.value}",
              style: const TextStyle(
                  color: Colors.blue, fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              "Condition: ${serviceController.weatherCondition.value}",
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),

          ],
        ),
          ],
        )
      ),
    );
  }
}
