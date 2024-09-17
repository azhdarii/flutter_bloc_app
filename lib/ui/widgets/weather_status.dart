import 'package:flutter/material.dart';

class WeatherStatus extends StatelessWidget {
  const WeatherStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0, top: 30),
          child: Text(
            'shiraz',
            style: TextStyle(fontSize: 25),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0, ),
          child: Text(
            '28',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Text(
          'clear sky',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [Text('max'), Text('40')],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [Text('min'), Text('20')],
              ),
            )
          ],
        )
      ],
    );
  }
}
