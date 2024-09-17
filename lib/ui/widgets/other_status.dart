import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Text('humidity'), Text('data')],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Text('wind speed'), Text('data')],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Text('sunrise'), Text('data')],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Text('sunset'), Text('data')],
          ),
        )
      ],
    );
  }
}
