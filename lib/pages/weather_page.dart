
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/data/services/geo_location_service.dart';
import 'package:weather_app/data/services/utils/weather_util.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'package:weather_app/pages/city_page.dart';
import 'package:weather_app/widgets/container_with_bg_image.dart';
import 'package:weather_app/widgets/custom_progress_indicator.dart';
import 'package:weather_app/widgets/weather_page_content.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({Key key, }) : super(key: key);

  

  

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  

  String _celcius = '';
  String _cityName = '';
  String _icon;
  String _description = 'weather for today';
  bool _isLoading = false;
 
//  @override
//  void initState() {
//     showWeatherByLocation();
//    super.initState();
//  }
 



 @override
    void didChangeDependecies(){
        super.didChangeDependencies();
      showWeatherByLocation();
    }
  Future<void> showWeatherByLocation() async{
  

    setState(() {
      _isLoading = true;
    });


      await Future.delayed(Duration(seconds: 5));

    final position = await GeoLocationService().getCurrentPosition();

    await getWeatherByLocation(position: position);
}

 




   
   @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;
   
    return  Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: IconButton(
            onPressed: ()async {
                await showWeatherByLocation();

            },
            icon: const Icon
            (Icons.navigation, size: 40,),
            ),
          ),
          actions: [
            IconButton(onPressed: () async{
             final _typedCity = await Navigator.push(context,
              MaterialPageRoute(builder: (context)=> CityPage()));

              await getWeatherByCity(_typedCity);

            },
          icon: const Icon(
            Icons.location_city,
            size: 40,
            ),
          ),
          SizedBox(width: 12,),
          ],
        ),
        body:  ContainerWithBgImage(
           
            child: _isLoading 
            ? const CustomProgressIndicator()
            : WeatherPageContent(size: _size, celcius: _celcius, icon: _icon, cityName: _cityName, description: _description),
          
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
     Future<void>getWeatherByLocation ({Position position}) async {
   

    final _data =
     await WeatherService(). getWeatherByLocation(position: position);


  _cityName = _data['name'];
  final kelvin = _data['main']['temp'] as num;

 _celcius = WeatherUtil.kelvinToCelcius(kelvin);
 _icon = WeatherUtil.getWeatherIcon(kelvin.toInt());

 _description = WeatherUtil.getDescription(int.parse(_celcius));

  setState(() {
      _isLoading = false;
    });
  }

  Future <void> getWeatherByCity(typedCity) async{
    setState(() {
      _isLoading = true;
    });
    final _data = await WeatherService().getWeatherByCity(typedCity);
  _cityName = _data['name'];
  final kelvin = _data['main']['temp'] as num;

 _celcius = WeatherUtil.kelvinToCelcius(kelvin);
 _icon = WeatherUtil.getWeatherIcon(kelvin.toInt());

 _description = WeatherUtil.getWeatherMessage(int.parse(_celcius));
  setState(() {
      _isLoading = false;
    });
  }
}


