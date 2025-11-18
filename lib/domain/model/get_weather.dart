class WeatherCode{
  String getWeather(int? wmoCode) {
    String stringResult = "";
    switch (wmoCode) {
      case 0:
        stringResult = "Clear sky";
        break;
      case 1:
      case 2:
      case 3:
        stringResult = "Mainly clear, partly cloudy, and overcast";
        break;
      case 45:
      case 48:
        stringResult = "Fog and depositing rime fog";
        break;
      case 51:
      case 53:
      case 55:
        stringResult = "Drizzle: Light, moderate, and dense intensity";
        break;
      case 56:
      case 57:
        stringResult = "Freezing Drizzle: Light and dense intensity";
        break;
      case 61:
      case 63:
      case 65:
        stringResult = "Rain: Slight, moderate and heavy intensity";
        break;
      case 66:
      case 67:
        stringResult = "Freezing Rain: Light and heavy intensity";
        break;
      case 71:
      case 73:
      case 75:
        stringResult = "Snow fall: Slight, moderate, and heavy intensity";
        break;
      case 77:
        stringResult = "Snow grains";
        break;
      case 80:
      case 81:
      case 82:
        stringResult = "Rain showers: Slight, moderate, and violent";
        break;
      case 85:
      case 86:
        stringResult = "Snow showers slight and heavy";
        break;
      case 95:
        stringResult = "Thunderstorm: Slight or moderate";
        break;
      case 96:
      case 99:
        stringResult = "Thunderstorm with slight and heavy hail";
        break;
    }
    return stringResult;
  }
}