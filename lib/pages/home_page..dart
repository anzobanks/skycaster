import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/getanimed_controller.dart';
import '../models/weather.dart';
import '../models/weatile.dart';
import '../widgets/custom_text.dart';
import '../widgets/weather_tile.dart';
import 'weather_details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<Weatile> weathers = [
    Weather.rainy,
    Weather.partlyCloudly,
    Weather.sunny,
    Weather.snowy
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFf1f3f2),
      appBar: AppBar(
          backgroundColor: const Color(0xFFf1f3f2),
          title: const CustomText(
              text: 'Weather',
              style: TextStyle(
                  color: Color(0xFF43474a),
                  fontWeight: FontWeight.bold,
                  fontSize: 30))),
      body: SafeArea(
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Color(0xFFf1f3f2),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              children: [
          
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Search for a city',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF738a9d),
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child:  ListView.separated(
                        itemBuilder: (context, index) =>
                          WeatherTile(
                              weathers: weathers,
                              width: width,
                              index: index,
                            ),
                        itemCount: 4,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      )
                )
              ],
            )),
      ),
    );
  }
}
