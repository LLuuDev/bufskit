import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Map<String, dynamic>? scoreInfo;
  var items = [""];

  _getData() async {
    var userInfo = await storage.read(key: 'userInfo');
    if (userInfo != null) {
      Map<String, dynamic> jsonData = jsonDecode(userInfo);
      setState(() {
        scoreInfo = jsonData['score'];
        items = jsonData['score'].keys.toList();
      });
    }
  }

  String? creditAvg = "0.00";
  String? rank = "0";
  String? rankMax = "0";
  String? credit = "00.0";
  String? creditSign = "00.0";
  Color gradeColor = const Color(0xff6597FA);
  Map<String, dynamic> scoreSemester = {};

  _changeSemester(nowSemester) {
    scoreSemester = scoreInfo![nowSemester]["subjectScore"];
    creditAvg = scoreInfo![nowSemester]["creditAvg"];
    rank = scoreInfo![nowSemester]["rank"].split('/')[0];
    rankMax = scoreInfo![nowSemester]["rank"].split('/')[1];
    credit = scoreInfo![nowSemester]["credit"];
    creditSign = scoreInfo![nowSemester]["creditSign"];
    // print(scoreSemester);
  }

  String? dropdownvalue;

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
                        '학기별 성',
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.only(
                                top: 4,
                              ),
                              height: 55,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(
                                    113, 111, 233, 1), //<-- SEE HERE
                              ),
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  hint: const Text(
                                    "학기를 선택해주세요",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      color: Colors.white, //<-- SEE HERE
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                  value: dropdownvalue,
                                  dropdownColor:
                                      const Color.fromRGBO(113, 111, 233, 1),
                                  // iconSize: 32,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                    _changeSemester(newValue);
                                  },
                                  underline: const SizedBox.shrink(),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
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
                      height: 90,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("평균 학점",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(creditAvg!,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      )),
                                  Text(" / 4.50",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text("학기 석차  ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                                Text(rank!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                                Text(" / $rankMax",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                              ]),
                              Row(children: [
                                Text("취득 학점  ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                                Text(credit!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                                Text(" / $creditSign",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...List.generate(
                              scoreSemester.keys.length,
                              (index) {
                                if (scoreSemester[scoreSemester.keys.toList()[index]]["gradeSymbol"].contains("A")) {
                                  gradeColor = const Color(0xff6597FA);
                                } else if (scoreSemester[scoreSemester.keys.toList()[index]]["gradeSymbol"].contains("B")) {
                                  gradeColor = const Color(0xffEEC252);
                                } else if (scoreSemester[scoreSemester.keys.toList()[index]]["gradeSymbol"].contains("C")) {
                                  gradeColor = const Color(0xffE47566);
                                } else if (scoreSemester[scoreSemester.keys.toList()[index]]["gradeSymbol"] == "P") {
                                  gradeColor = const Color(0xff92E16D);
                                } else {
                                  gradeColor = const Color(0xff9C9DA6);
                                }
                                return SizedBox(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 75,
                                        margin: EdgeInsets.only(bottom: 15),
                                        decoration: BoxDecoration(
                                          color: gradeColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              spreadRadius: 0,
                                              blurRadius: 20,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${scoreSemester[scoreSemester.keys.toList()[index]]["gradeSymbol"]}",
                                            style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                            height: 75,
                                            margin: EdgeInsets.only(bottom: 15),
                                            padding: EdgeInsets.only(left: 50),
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
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${scoreSemester.keys.toList()[index]}",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "${scoreSemester[scoreSemester.keys.toList()[index]]["credit"]}학점",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
