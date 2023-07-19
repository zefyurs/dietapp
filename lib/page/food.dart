import 'package:flutter/material.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

import '../consonent.dart';
import '../food_model.dart';
import '../util.dart';

class FoodAddPage extends StatefulWidget {
  final Food food;
  const FoodAddPage({super.key, required this.food});

  @override
  State<FoodAddPage> createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<FoodAddPage> {
  Food get food => widget.food;

  TextEditingController kcalController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              food.memo = memoController.text;
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              width: 60,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: mainColor,
              ),
              child: const Text(style: TextStyle(color: Colors.white), '저장'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, idx) {
                  if (idx == 0) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        children: [
                          const Text(
                            "오늘 어떤 음식을 드셨나요?",
                            style: TextStyle(fontSize: 20),
                          ),
                          InkWell(
                            child: SizedBox(
                                width: 250,
                                child: food.image.isEmpty
                                    ? AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset("assets/img/food.png"),
                                      )
                                    : AssetThumb(asset: Asset(food.image, "food.png", 0, 0), width: 100, height: 100)),
                            onTap: () {
                              selectImage();
                            },
                          )
                        ],
                      ),
                    );
                  } else if (idx == 1) {
                    String _t = food.time.toString();

                    String _m = _t.substring(_t.length - 2);
                    String _h = _t.substring(0, _t.length - 2);
                    TimeOfDay time = TimeOfDay(hour: int.parse(_h), minute: int.parse(_m));
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            const Text(
                              " 식사시간",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                                onTap: () async {
                                  TimeOfDay? _time =
                                      await showTimePicker(context: context, initialTime: TimeOfDay.now());

                                  if (_time == null) {
                                    return;
                                  }
                                  setState(() {
                                    food.time = int.parse("${_time.hour}${Utils.makeTowDiget(_time.minute)}");
                                  });
                                },
                                child: Text(
                                    "${time.hour > 11 ? "오전" : "오후"}${Utils.makeTowDiget(time.hour % 12)}:${Utils.makeTowDiget(time.minute)}")),
                          ]),
                          const SizedBox(height: 4),
                          GridView.count(
                              crossAxisCount: 4,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              childAspectRatio: 4,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                mealTime.length,
                                (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        food.meal = index;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: food.meal == index ? mainColor : ibgColor,
                                      ),
                                      child: Text(
                                        style: TextStyle(color: food.meal == index ? Colors.white : iTxtColor),
                                        mealTime[index],
                                      ),
                                    ),
                                  );
                                },
                              )), // Container(
                        ],
                      ),
                    );
                  } else if (idx == 2) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            " 식단 평가",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          GridView.count(
                              crossAxisCount: 4,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              childAspectRatio: 4,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                mealType.length,
                                (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        food.type = index;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: food.type == index ? mainColor : ibgColor,
                                      ),
                                      child: Text(
                                        style: TextStyle(color: food.type == index ? Colors.white : iTxtColor),
                                        mealType[index],
                                      ),
                                    ),
                                  );
                                },
                              )), // Container(
                        ],
                      ),
                    );
                  } else if (idx == 3) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Text(
                            " 메모",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            maxLines: 8,
                            minLines: 8,
                            keyboardType: TextInputType.multiline,
                            controller: memoController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: ibgColor),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade400),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ))),
                          )
                        ]));
                  }
                  return Container();
                },
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> selectImage() async {
    final _img = await MultiImagePicker.pickImages();

    if (_img.isNotEmpty) {
      return;
    }

    setState(() {
      food.image = _img.first.identifier;
    });
  }
}
