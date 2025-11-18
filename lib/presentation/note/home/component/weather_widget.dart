import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/domain/model/current_weather.dart';

class WeatherWidget extends StatelessWidget{
  final CurrentWeather? currentWeather;

  const WeatherWidget({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if(currentWeather == null){
      return SizedBox.shrink();
    }else{
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        color: theme.colorScheme.onSecondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currentWeather?.temperature ?? "",
              style: TextStyle(
                  color: theme.colorScheme.secondary
              ),
            ),
            Text(
              currentWeather?.weather ?? "",
              style: TextStyle(
                  color: theme.colorScheme.secondary
              ),
            ),
          ],
        ),
      );
    }
  }
}