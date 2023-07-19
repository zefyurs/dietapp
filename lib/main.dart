import 'package:dietapp/page/food.dart';
import 'package:dietapp/util.dart';
import 'package:flutter/material.dart';

import 'food_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('appBar')),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "오늘"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "기록"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "통계"),
          BottomNavigationBarItem(icon: Icon(Icons.photo_album_outlined), label: "갤러리"),
        ],
        currentIndex: currentIndex,
        onTap: (idx) {
          setState(() {
            currentIndex = idx;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              builder: (ctx) {
                return SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      TextButton(
                        child: const Text("식단"),
                        onPressed: () async {
                          Navigator.of(context).pop();

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => FoodAddPage(
                                    food: Food(
                                      date: Utils.getFormatTime(time),
                                      kcal: 0,
                                      memo: "",
                                      type: 0,
                                      meal: 0,
                                      image: "",
                                      time: 1130,
                                    ),
                                  )));
                        },
                      ),
                      TextButton(
                        child: const Text("운동"),
                        onPressed: () async {
                          // await Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (ctx) => WorkoutAddPage(
                          //       workout: Workout(
                          //           date: Utils.getFormatTime(time),
                          //           time: 0,
                          //           memo: "",
                          //           name: "",
                          //           image: ""
                          //       ),
                          //     ))
                          // );
                          // getHistories();
                        },
                      ),
                      TextButton(
                        child: const Text("눈바디"),
                        onPressed: () async {
                          // await Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (ctx) => EyeBodyAddPage(
                          //       eyeBody: EyeBody(
                          //           date: Utils.getFormatTime(time),
                          //           weight: 0,
                          //           image: ""
                          //       ),
                          //     ))
                          // );
                          // getHistories();
                        },
                      ),
                    ],
                  ),
                );
              });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }

  Widget getPage() {
    if (currentIndex == 0) {
      return getMainPage();
      // } else if (currentIndex == 1) {
      //   return const HistoryPage();
      // }else if(currentIndex == 2){
      //   return getChartPage();
      // }else if(currentIndex == 3){
      //   return getGalleryPage();
    }
    return Container();
  }

  Widget getMainPage() {
    return const Column(children: [
      Text('main page'),
    ]);
  }
  //         children: [
  //           todayFood.isEmpty ? Container() : Container(
  //             height: 140,
  //             child: ListView(
  //               scrollDirection: Axis.horizontal,
  //               children: List.generate(todayFood.length, (idx){
  //                 return InkWell(child: Container(
  //                   width: 140,
  //                   child: FoodCard(food: todayFood[idx]),
  //                 ),
  //                   onTap: () async {
  //                     await Navigator.of(context).push(
  //                         MaterialPageRoute(builder: (ctx) => FoodAddPage(
  //                           food: todayFood[idx],
  //                         ))
  //                     );
  //                     getHistories();
  //                   },
  //                 );
  //               }),
  //             ),
  //           ),
  //           todayWorkout.isEmpty ? Container() : Container(
  //             height: 140,
  //             child: ListView(
  //               scrollDirection: Axis.horizontal,
  //               children: List.generate(todayWorkout.length, (idx){
  //                 return InkWell(child: Container(
  //                   width: 140,
  //                   child: WorkoutCard(workout: todayWorkout[idx]),
  //                 ),
  //                     onTap: () async {
  //                       await Navigator.of(context).push(
  //                           MaterialPageRoute(builder: (ctx) => WorkoutAddPage(
  //                             workout: todayWorkout[idx],
  //                           ))
  //                       );
  //                       getHistories();
  //                     }
  //                 );
  //               }),
  //             ),
  //           ),
  //           todayEyeBody.isEmpty ? Container() : Container(
  //             height: 140,
  //             child: ListView(
  //               scrollDirection: Axis.horizontal,
  //               children: List.generate(todayEyeBody.length, (idx){
  //                 return InkWell(child: Container(
  //                   width: 140,
  //                   child: EyeBodyCard(eyeBody: todayEyeBody[idx]),
  //                 ),
  //                   onTap: () async {
  //                     await Navigator.of(context).push(
  //                         MaterialPageRoute(builder: (ctx) => EyeBodyAddPage(
  //                           eyeBody: todayEyeBody[idx],
  //                         ))
  //                     );
  //                     getHistories();
  //                   },
  //                 );
  //               }),
  //             ),
  //           ),
  //         ]
  //     ),
  //   );
  // }
}
