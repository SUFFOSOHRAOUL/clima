import 'package:clima/Services/networking.dart';
import 'package:clima/Services/location.dart';

const appid = '38167d4dc27b0b2d852fdbc046da4fd2';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location newlocation = Location();
    await newlocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        stringurl:
            '$openWeatherMapURL?lat=${newlocation.latitude}&lon=${newlocation.longitude}&appid=$appid&units=metric');
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
