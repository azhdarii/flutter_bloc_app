import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(),
          child: const Text('search'),
        ),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
              decoration: InputDecoration(
            hintText: 'insert your city',
          )),
        ))
      ],
    );
  }
}
