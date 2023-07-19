// import 'package:flutter/material.dart';

// import 'food_model.dart';

// class TestPage extends StatefulWidget {
//   final Food food;
//   const TestPage({super.key, required this.food});

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   Food get food => widget.food;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(itemBuilder: (ctx, idx) {
//         if (idx == 0) {
//           return Container(
//             child: InkWell(
//               child: Text('dd'),
//               onTap: () {},
//             ),
//           );
//         } else if (idx == 1) {
//           return Container(
//               child: Column(
//             children: [
//               Row(children: <Widget>[
//                 const Text("식사시간"),
//                 Text(food.date.toString()),
//               ]),
//               // GridView.count(
//               //   physics: const NeverScrollableScrollPhysics(),

//               //   shrinkWrap: true, // 크기를 줄여주는 역할
//               //   crossAxisCount: 4,
//               //   crossAxisSpacing: 4,
//               //   mainAxisSpacing: 4,
//               //   childAspectRatio: 2,
//               //   children: List.generate(
//               //       mealTime.length,
//               //       (index) => Container(
//               //             decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(8),
//               //               color: food.type == index ? mainColor : ibgColor,
//               //             ),
//               //             alignment: Alignment.center,
//               //             child: Text(
//               //               mealType[index],
//               //               style: TextStyle(
//               //                 color: food.type == index ? Colors.white : iTxtColor,
//               //               ),
//               //             ),
//               //           )),
//               // ),
//             ],
//           ));
//         }

//         return Container();
//       }),
//     );
//   }
// }
