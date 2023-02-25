import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  static const storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    _getData();
  }
  Map<String,dynamic>? classSchedule;
  var items = [""];
  List<dynamic> scheduleSemester = [[],[],[],[],[]];

  _getData () async {
    var userInfo = await storage.read(key: 'userInfo');
    if (userInfo != null) {
      Map<String,dynamic> jsonData = jsonDecode(userInfo);
      setState(() {
        classSchedule = jsonData['class'];
        items = jsonData['class'].keys.toList();
      });
    }
  }
  _changeSemester (nowSemester) {
    scheduleSemester = classSchedule![nowSemester].toList();
    // print(scheduleSemester);

  }

  List week = ['월', '화', '수', '목', '금'];
  var colunmLength = 24;
  double weekHeight = 20;
  double boxHeight = 45;

  String? dropdownvalue;

  List colorList = [
    const Color(0xffCC7266),
    const Color(0xffC9A85C),
    const Color(0xffA8CB70),
    const Color(0xff6EB5A5),
    const Color(0xff6B8CC7),
    const Color(0xffD6925A),
    const Color(0xff8770C0),
    const Color(0xffCC7266),
    const Color(0xffC9A85C),
    const Color(0xffA8CB70),
    const Color(0xff6EB5A5),
    const Color(0xff6B8CC7),
    const Color(0xffD6925A),
    const Color(0xff8770C0),
  ];

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    var tmpcolor = colorList;
    var classList = {};
    var colorCount = 0;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(15),
              color: const Color.fromRGBO(113, 111, 233, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '시간표',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              flex: 10,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 50,
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  // isExpanded: true,
                                  hint: const Text(
                                    "학기를 선택해주세요",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      color: Colors.black, //<-- SEE HERE
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                  value: dropdownvalue,
                                  // iconSize: 32,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
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
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: colunmLength / 2 * boxHeight + weekHeight + 2,
                          // height: colunmLength / 2 * boxHeight + weekHeight, 왜 여기에 +2를 지우면 오버플로우가 날까
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: weekHeight,
                                          ),
                                          ...List.generate(
                                            colunmLength,
                                            (index) {
                                              if (index % 2 == 0) {
                                                return const Divider(
                                                  color: Colors.grey,
                                                  height: 0,
                                                );
                                              }
                                              return SizedBox(
                                                height: boxHeight,
                                                child: Center(
                                                    child: Text(
                                                        '${(index ~/ 2 + 8) % 12 + 1}')),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              for (int i = 0; i < 5; i++) ...[
                                const VerticalDivider(
                                  color: Colors.grey,
                                  width: 0,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Stack(
                                    // clipBehavior: Clip.none,
                                    // fit: StackFit.expand,
                                    // clipBehavior: Clip.antiAlias,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: weekHeight,
                                            child: Center(
                                              child: Text(
                                                '${week[i]}',
                                              ),
                                            ),
                                          ),
                                          ...List.generate(
                                            colunmLength,
                                            (index) {
                                              if (index % 2 == 0) {
                                                return const Divider(
                                                  color: Colors.grey,
                                                  height: 0,
                                                );
                                              }
                                              return SizedBox(
                                                height: boxHeight,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      ...List.generate(
                                          scheduleSemester[i].length,
                                          (index) {
                                            // print(index);
                                            if (scheduleSemester[i][index] != null) {
                                              if (!classList.containsKey(scheduleSemester[i][index][0])) {
                                                classList[scheduleSemester[i][index][0]] = tmpcolor[colorCount];
                                                // print(classList);

                                                setState(() {
                                                  colorCount += 1;
                                                });
                                              }
                                              return Positioned(
                                                  top: 20 + boxHeight * index,
                                                  height: boxHeight*scheduleSemester[i][index][1],
                                                  width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                      50) /
                                                      5,
                                                  child: Container(
                                                      color: classList[scheduleSemester[i][index][0]],
                                                      padding: const EdgeInsets.all(3),
                                                      child: SingleChildScrollView(
                                                        physics: const  ClampingScrollPhysics(),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                scheduleSemester[i][index][0],
                                                                overflow: TextOverflow.clip,
                                                                // maxLines: 2,
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.white,
                                                                )),
                                                            Text(
                                                                scheduleSemester[i][index][2],
                                                                overflow: TextOverflow.clip,
                                                                style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.white,
                                                                )),
                                                            Text(
                                                                scheduleSemester[i][index][3],
                                                                overflow: TextOverflow.clip,
                                                                style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.white,
                                                                )),
                                                          ],
                                                        ),
                                                      )
                                                  )
                                              );
                                            }
                                            return SizedBox(
                                              height: boxHeight,
                                            );
                                          },
                                      ),

                                    ],
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),

                    // const SizedBox(height: 15),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
