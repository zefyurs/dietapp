import 'package:flutter/material.dart';

import '../consonent.dart';

class IndexPage extends StatelessWidget {
  final DateTime date;
  const IndexPage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(date.toString()),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: cardSize + 50,
            child: ListView.builder(
              itemBuilder: (ctx, idx) {
                return Container(
                  child: Text('Hello World!'),
                  height: cardSize,
                  width: cardSize,
                  color: Colors.red,
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
                  child: Text('Hello World!'),
                );
              },
              itemCount: 1,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
