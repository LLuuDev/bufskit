import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Map<String, dynamic>? todayFood = {
    "corner1": ["", "", ""],
    "corner2": "",
    "corner3": ["", "", ""],
    "common": [],
    "breakfast": "",
    "snack": []
  };
  List<String> engWeekday = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday"
  ];

  _getData() async {
    var foodSchedule = await storage.read(key: 'foodSchedule');
    if (foodSchedule != null) {
      Map<String, dynamic> jsonData = jsonDecode(foodSchedule);
      DateTime now = DateTime.now();
      // DateTime now = DateTime.utc(2023, 2, 28);
      if (now.weekday != 6 && now.weekday != 7) {
        setState(() {
          todayFood = jsonData[engWeekday[now.weekday-1]];
        });
      }
      // print(now.weekday);
      // print(todayFood);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
              color: const Color.fromRGBO(113, 111, 233, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: MediaQuery.of(context).padding.top, color: const Color.fromRGBO(113, 111, 233, 1),),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero, // 패딩 설정
                        constraints: BoxConstraints(), // constraints
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Text(
                        '오늘의 학식',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],),),

                ],
              ),
            ),
          ),
          Flexible(
            flex: 10,
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 20,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    height: 140,
                                    padding: const EdgeInsets.all(15),
                                    color:
                                        const Color.fromRGBO(113, 111, 233, 1),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "아침",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "점심 / 저녁",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "정식",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "셀프라면",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "분식",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 140,
                                    padding: const EdgeInsets.all(15),
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "08:00 ~ 09:00",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "10:30 ~ 18:00",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "12:00 ~ 13:30",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "13:30 ~ 18:00",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "14:00 ~ 18:00",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 0,
                                                blurRadius: 20,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 0,
                                                      blurRadius: 20,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      color:
                                                          const Color.fromRGBO(
                                                              113, 111, 233, 1),
                                                      child: Center(
                                                        child: Text(
                                                          "코너1",
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 87,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${todayFood!["corner1"][0]}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${todayFood!["corner1"][1]}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${todayFood!["corner1"][2]}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 0,
                                                      blurRadius: 20,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      color:
                                                          const Color.fromRGBO(
                                                              113, 111, 233, 1),
                                                      child: Center(
                                                        child: Text(
                                                          "코너2",
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${todayFood!["corner2"]}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.2),
                                              spreadRadius: 0,
                                              blurRadius: 20,
                                              offset:
                                              const Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 60,
                                              padding:
                                              const EdgeInsets.all(
                                                  15),
                                              color:
                                              const Color.fromRGBO(
                                                  113, 111, 233, 1),
                                              child: Center(
                                                child: Text(
                                                  "조식",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 35,
                                              // padding:
                                              // const EdgeInsets.all(
                                              //     15),
                                              color: Colors.white,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    "${todayFood!["breakfast"]}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400,
                                                      color:
                                                      Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              spreadRadius: 0,
                                              blurRadius: 20,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 60,
                                              padding: const EdgeInsets.all(15),
                                              color: const Color.fromRGBO(
                                                  113, 111, 233, 1),
                                              child: Center(
                                                child: Text(
                                                  "분식",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 102,
                                              // padding: const EdgeInsets.all(15),
                                              color: Colors.white,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  ...List.generate(
                                                      todayFood!["snack"].length,
                                                          (index) {
                                                        return Text(
                                                          "${todayFood!["snack"][index]}",
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.black,
                                                          ),
                                                        );
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 0,
                                                blurRadius: 20,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 0,
                                                      blurRadius: 20,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      color:
                                                          const Color.fromRGBO(
                                                              113, 111, 233, 1),
                                                      child: Center(
                                                        child: Text(
                                                          "코너3",
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 87,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${todayFood!["corner3"][0]}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${todayFood!["corner3"][1]}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${todayFood!["corner3"][2]}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0,
                                          blurRadius: 20,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          padding: const EdgeInsets.all(15),
                                          color: const Color.fromRGBO(
                                              113, 111, 233, 1),
                                          child: Center(
                                            child: Text(
                                              "공통찬",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 87,
                                          // padding: const EdgeInsets.all(15),
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ...List.generate(
                                                  todayFood!["common"].length,
                                                  (index) {
                                                return Text(
                                                  "${todayFood!["common"][index]}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
