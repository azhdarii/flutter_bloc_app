import 'package:flutter/material.dart';



  IconData IconMaker(String condition) {



    condition = condition.toLowerCase(); // Convert to lowercase for case-insensitive matching

    if (condition.contains('clear') || condition.contains('sunny')) {
      return Icons.wb_sunny; // Sunny icon
    } else if (condition.contains('partly cloudy') ||
        condition.contains('partially cloudy') ||
        condition.contains('few clouds')) {
      return Icons.wb_cloudy; // Partly cloudy icon
    } else if (condition.contains('cloudy') || condition.contains('overcast')) {
      return Icons.cloud; // Cloudy icon
    } else if (condition.contains('rain') || condition.contains('showers')) {
      return Icons.cloudy_snowing; // Rain icon
    } else if (condition.contains('thunderstorm') || condition.contains('storm')) {
      return Icons.flash_on; // Thunderstorm icon
    } else if (condition.contains('drizzle')) {
      return Icons.grain; // Drizzle icon (same as rain)
    } else if (condition.contains('snow')) {
      return Icons.ac_unit; // Snow icon
    } else if (condition.contains('sleet')) {
      return Icons.ac_unit; // Sleet icon (same as snow)
    } else if (condition.contains('hail')) {
      return Icons.ac_unit; // Hail icon (same as snow)
    } else if (condition.contains('fog') || condition.contains('mist')) {
      return Icons.blur_on; // Fog or mist icon
    } else if (condition.contains('windy') || condition.contains('wind')) {
      return Icons.air; // Windy icon
    } else if (condition.contains('dust')) {
      return Icons.filter_drama; // Dust icon
    } else if (condition.contains('haze')) {
      return Icons.wb_cloudy; // Haze icon (same as partly cloudy)
    } else if (condition.contains('smoke')) {
      return Icons.smoke_free; // Smoke icon
    } else {
      return Icons.help_outline; // Default icon for unknown conditions
    }


  }

