import 'dart:html';

class WeatherUtil {

static int kelvinToCelcius(double kelvin){
  return (kelvin - 273.15).round();
}
static String getWeatherIcon(int kelvin){
  if (kelvin < 300) {
    return '';
  }else if (kelvin < 400){
    return '';
  }else if (kelvin < 600){
    return '';
  }else if (kelvin < 700){
    return '';
  }else if (kelvin < 800){
    return '';
  }else if (kelvin == 800){
    return '';
  }else if (kelvin <= 804){
    return '';
  }else {
    return'';
  }
}

  static String getWeatherMessage(int temp){
    if (temp > 25) {
      return 'It\'s time';
    }else if (temp > 20) {
      return 'Time for shorts and ';
    }else if (temp < 10) {
      return 'You\' ll need  and ';
    }else  {
      return 'Bring a  just in case ';
    }
  }

}