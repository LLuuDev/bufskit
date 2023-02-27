import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BusPage extends StatefulWidget {
  const BusPage({Key? key}) : super(key: key);

  @override
  State<BusPage> createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  List<dynamic>? busTime = [];
  String titleSecond = "0";
  List<dynamic>? busTimelist = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]];

  late Timer _timer;
  _getData() async {
    var busSchedule = await storage.read(key: 'busSchedule');

    if (busSchedule != null) {
      List<dynamic> jsonData = jsonDecode(busSchedule);
      setState(() {
        busTime = jsonData;
      });
    }
    // print(busSchedule);
    _timer = Timer.periodic(Duration(milliseconds:1000), (timer) async {
      DateTime now = DateTime.now();
      // DateTime now = DateTime.utc(2023, 2, 28, 8, 30, 00);
      var nowSum = ((now.hour * 60) + now.minute);
      var recentArrived = 0;
      // print(nowSum);
      for (int i=0;i<busTime!.length;i++) {
        if(busTime![i] >= nowSum) {
          recentArrived = i;
          break;
        }
      }
      for (int i=0;i<8;i++) {
        if (recentArrived-4+i+1 < 1) {
          busTimelist![i][0] = busTime!.length + (recentArrived-4+i+1);
          var tmpBus = busTime![busTime!.length + (recentArrived-4+i)];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (1440 - tmpBus + nowSum) * -1;
          } else {
            tmpTime = (nowSum - tmpBus) * -1;
          }
          busTimelist![i][1] = tmpTime;
        } else if (recentArrived-4+i+1 > busTime!.length) {
          busTimelist![i][0] = (recentArrived-4+i+1) - busTime!.length;
          var tmpBus = busTime![(recentArrived-4+i) - busTime!.length];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (tmpBus - nowSum);
          } else {
            tmpTime = (1440-nowSum + tmpBus);
          }
          busTimelist![i][1] = tmpTime;
        } else {
          busTimelist![i][0] = recentArrived-4+i+1;
          var tmpBus = busTime![(recentArrived-4+i)];
          num tmpTime = 0;
          tmpTime = (tmpBus - nowSum);
          busTimelist![i][1] = tmpTime;
        }
      }
      setState(() {
        titleSecond = (59 - now.second).toString();
      });
      // print(titleSecond);
    });


  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();

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
              padding: const EdgeInsets.all(15),
              color: const Color.fromRGBO(113, 111, 233, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '버스 시간표',
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
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
                      child: Column(
                        children: [
                          Container(
                              height: 55,
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              color: const Color.fromRGBO(113, 111, 233, 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "캠퍼스",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    titleSecond,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 155,
                              padding: const EdgeInsets.all(15),
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${busTimelist![0][0]}회차    ${busTimelist![0][1]}분",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${busTimelist![1][0]}회차    ${busTimelist![1][1]}분",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${busTimelist![2][0]}회차    ${busTimelist![2][1]}분",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${busTimelist![3][0]}회차    ${busTimelist![3][1]}분",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        "${busTimelist![4][0]}회차    ${busTimelist![4][1]==0 ? "잠시후" : "${busTimelist![4][1]}분"}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${busTimelist![5][0]}회차    ${busTimelist![5][1]}분",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${busTimelist![6][0]}회차    ${busTimelist![6][1]}분",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${busTimelist![7][0]}회차    ${busTimelist![7][1]}분",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ],
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
