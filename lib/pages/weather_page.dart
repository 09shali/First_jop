import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants/app_constants.dart';
import 'package:weather_app/pages/city_page.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key key, }) : super(key: key);

  

  

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  

  String _celius = '92';
  String _description = 'weather for today';


 @override
 void initState (){

 showWeatherByLocation();
  
   super.initState();
 }
  Future<void> showWeatherByLocation() async{
    final position = await getCurrentPosition();

    await getWeatherByLocation(position: position);

    log('position latitude: ${position. latitude}');
    log('position longitude: ${position. longitude}');
  }

  Future<Position> getCurrentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

  Future<void>getWeatherByLocation({@required Position position}) async{
    var client = http.Client();
try {

  Uri _uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$openWeatherApiKey');
 final response = await client.get(_uri);

 if(response.statusCode == 200 || response.statusCode == 201){

final body = response.body;
 log('response.body ==$body');

 final _data = jsonDecode(body);
 log('response._data ==$_data');
 } 

 

 

 log('response ==$response');

} catch (e) {
  throw Exception(e);
}
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
            onPressed: (){},
            icon: const Icon(Icons.navigation),
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> CityPage()));
            },
          icon: const Icon(
            Icons.location_city,
            size: 40,
            ),
          ),
          SizedBox(width: 12,),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
           
            child: Column(
             
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: _size.height * 0.1),
                Text(
                  '$_celius \u00B0 ☀',
                  style: const TextStyle(
                    fontSize: 84,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: _size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: Text(
                    _description,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
}
