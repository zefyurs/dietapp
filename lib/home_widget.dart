import 'package:flutter/material.dart';

import 'consonent.dart';

class GetHomeWidget extends StatelessWidget {
  final DateTime dateTime;
  const GetHomeWidget({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: double.infinity,
          height: cardSize + 50,
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              return Container(
                height: cardSize,
                width: cardSize,
                color: Colors.red,
                child: const Text('Hello World!'),
              );
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Container(
          color: Colors.grey,
          height: 100,
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              if (idx == 0) {
                // 몸무게
              } else {
                // 눈바디
              }
              return Container(
                height: cardSize,
                width: cardSize,
                color: Colors.red,
                child: const Text('Hello World!'),
              );
            },
            itemCount: 1,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
