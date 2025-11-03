import 'package:data_extraction_listing/weather_app_example/model/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hava Durummu", style: TextStyle(color: Colors.white),), centerTitle: true, backgroundColor: Colors.blue[800],),
      body: HomePage(),
    );
  }
}
// /weather?q=ankara&appid='

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> cities = ["Adana", "Çorum", "Osmaniye", "Gümüşhane", "Ankara", "Bursa", "Antalya"];

  String? selected;
  Future<WeatherModel>? weatherFuture;

  void selectedCity(String city) {
    setState(() {
      selected = city;
      weatherFuture = getWeather(city);
    });
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      queryParameters: {
        "appid": "5ff5f6121eced2f3ad373070cbbb2040",
        "lang": "tr",
        "units": "metric",
      },
    ),
  );

  Future<WeatherModel> getWeather(String selectedCity) async {
    final response = await dio.get(
      '/weather',
      queryParameters: {"q": selectedCity},
    );

    var model = WeatherModel.fromJson(response.data);
    debugPrint(model.main?.temp.toString());
    return model;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (weatherFuture != null)
          FutureBuilder(
            future: weatherFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.hasData) {
                return _buildWeatherCard(snapshot.data!);
              }
              return SizedBox();
            },
          ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final isSelected = selected == cities[index];
              return GestureDetector(
                onTap: () => selectedCity(cities[index]),
                child: Card(color: isSelected ? Colors.blue[100] : null,child: Center(child: Text(cities[index])),),
              );
            },
            itemCount: cities.length,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherCard(WeatherModel snapshot) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Text(
              snapshot.name!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8,),
            Text("${snapshot.main!.temp!.round()}°" , style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: 8,),
            Text(snapshot.weather?[0].description ?? 'Değer Bulunamadı'),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.water_drop),
                    SizedBox(height: 4,),
                    Text(snapshot.main!.humidity!.round().toString())
                  ],
                ),
                SizedBox(width: 32,),
                Column(
                  children: [
                    Icon(Icons.air),
                    SizedBox(height: 4,),
                    Text(snapshot.wind!.speed!.round().toString())
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
