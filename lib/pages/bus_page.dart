import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

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

  List<dynamic>? busTime0 = [];
  List<dynamic>? busTime1 = [];
  List<dynamic>? busTime2 = [];
  List<dynamic>? busTime3 = [];
  List<dynamic>? busTime4 = [];
  String titleSecond = "0";
  List<dynamic>? busTimelist0 = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]];
  List<dynamic>? busTimelist1 = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]];
  List<dynamic>? busTimelist2 = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]];
  List<dynamic>? busTimelist3 = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]];
  List<dynamic>? busTimelist4 = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]];

  late Timer _timer;
  _getData() async {
    var busSchedule = await storage.read(key: 'busSchedule');

    if (busSchedule != null) {
      List<dynamic> jsonData = jsonDecode(busSchedule);
      for (int i=0;i<jsonData.length;i++) {
        busTime0?.add(jsonData[i]);
        busTime1?.add(jsonData[i]+5);
        busTime2?.add(jsonData[i]+10);
        busTime3?.add(jsonData[i]+14);
        busTime4?.add(jsonData[i]+19);
      }
      // setState(() {
      //   busTime = jsonData;
      // });
    }
    // print(busSchedule);

    _setBustime0() {
      DateTime now = DateTime.now();
      // DateTime now = DateTime.utc(2023, 2, 28, 8, 30, 00);
      var nowSum = ((now.hour * 60) + now.minute);
      var recentArrived = 0;
      // print(nowSum);
      for (int i=0;i<busTime0!.length;i++) {
        if(busTime0![i] >= nowSum) {
          recentArrived = i;
          break;
        }
      }
      for (int i=0;i<4;i++) {
        if (recentArrived-2+i+1 < 1) {
          busTimelist0![i][0] = busTime0!.length + (recentArrived-2+i+1);
          var tmpBus = busTime0![busTime0!.length + (recentArrived-2+i)];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (1440 - tmpBus + nowSum) * -1;
          } else {
            tmpTime = (nowSum - tmpBus) * -1;
          }
          busTimelist0![i][1] = tmpTime;
        } else if (recentArrived-2+i+1 > busTime0!.length) {
          busTimelist0![i][0] = (recentArrived-2+i+1) - busTime0!.length;
          var tmpBus = busTime0![(recentArrived-2+i) - busTime0!.length];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (tmpBus - nowSum);
          } else {
            tmpTime = (1440-nowSum + tmpBus);
          }
          busTimelist0![i][1] = tmpTime;
        } else {
          busTimelist0![i][0] = recentArrived-2+i+1;
          var tmpBus = busTime0![(recentArrived-2+i)];
          num tmpTime = 0;
          tmpTime = (tmpBus - nowSum);
          busTimelist0![i][1] = tmpTime;
        }
      }
      setState(() {
        titleSecond = (59 - now.second).toString();
      });
    }
    _setBustime1() {
      DateTime now = DateTime.now();
      // DateTime now = DateTime.utc(2023, 2, 28, 8, 30, 00);
      var nowSum = ((now.hour * 60) + now.minute);
      var recentArrived = 0;
      // print(nowSum);
      for (int i=0;i<busTime1!.length;i++) {
        if(busTime1![i] >= nowSum) {
          recentArrived = i;
          break;
        }
      }
      for (int i=0;i<4;i++) {
        if (recentArrived-2+i+1 < 1) {
          busTimelist1![i][0] = busTime1!.length + (recentArrived-2+i+1);
          var tmpBus = busTime1![busTime1!.length + (recentArrived-2+i)];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (1440 - tmpBus + nowSum) * -1;
          } else {
            tmpTime = (nowSum - tmpBus) * -1;
          }
          busTimelist1![i][1] = tmpTime;
        } else if (recentArrived-2+i+1 > busTime1!.length) {
          busTimelist1![i][0] = (recentArrived-2+i+1) - busTime1!.length;
          var tmpBus = busTime1![(recentArrived-2+i) - busTime1!.length];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (tmpBus - nowSum);
          } else {
            tmpTime = (1440-nowSum + tmpBus);
          }
          busTimelist1![i][1] = tmpTime;
        } else {
          busTimelist1![i][0] = recentArrived-2+i+1;
          var tmpBus = busTime1![(recentArrived-2+i)];
          num tmpTime = 0;
          tmpTime = (tmpBus - nowSum);
          busTimelist1![i][1] = tmpTime;
        }
      }
      setState(() {
        titleSecond = (59 - now.second).toString();
      });
    }
    _setBustime2() {
      DateTime now = DateTime.now();
      // DateTime now = DateTime.utc(2023, 2, 28, 8, 30, 00);
      var nowSum = ((now.hour * 60) + now.minute);
      var recentArrived = 0;
      // print(nowSum);
      for (int i=0;i<busTime2!.length;i++) {
        if(busTime2![i] >= nowSum) {
          recentArrived = i;
          break;
        }
      }
      for (int i=0;i<4;i++) {
        if (recentArrived-2+i+1 < 1) {
          busTimelist2![i][0] = busTime2!.length + (recentArrived-2+i+1);
          var tmpBus = busTime2![busTime2!.length + (recentArrived-2+i)];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (1440 - tmpBus + nowSum) * -1;
          } else {
            tmpTime = (nowSum - tmpBus) * -1;
          }
          busTimelist2![i][1] = tmpTime;
        } else if (recentArrived-2+i+1 > busTime2!.length) {
          busTimelist2![i][0] = (recentArrived-2+i+1) - busTime2!.length;
          var tmpBus = busTime2![(recentArrived-2+i) - busTime2!.length];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (tmpBus - nowSum);
          } else {
            tmpTime = (1440-nowSum + tmpBus);
          }
          busTimelist2![i][1] = tmpTime;
        } else {
          busTimelist2![i][0] = recentArrived-2+i+1;
          var tmpBus = busTime2![(recentArrived-2+i)];
          num tmpTime = 0;
          tmpTime = (tmpBus - nowSum);
          busTimelist2![i][1] = tmpTime;
        }
      }
      setState(() {
        titleSecond = (59 - now.second).toString();
      });
    }
    _setBustime3() {
      DateTime now = DateTime.now();
      // DateTime now = DateTime.utc(2023, 2, 28, 8, 30, 00);
      var nowSum = ((now.hour * 60) + now.minute);
      var recentArrived = 0;
      // print(nowSum);
      for (int i=0;i<busTime3!.length;i++) {
        if(busTime3![i] >= nowSum) {
          recentArrived = i;
          break;
        }
      }
      for (int i=0;i<4;i++) {
        if (recentArrived-2+i+1 < 1) {
          busTimelist3![i][0] = busTime3!.length + (recentArrived-2+i+1);
          var tmpBus = busTime3![busTime3!.length + (recentArrived-2+i)];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (1440 - tmpBus + nowSum) * -1;
          } else {
            tmpTime = (nowSum - tmpBus) * -1;
          }
          busTimelist3![i][1] = tmpTime;
        } else if (recentArrived-2+i+1 > busTime3!.length) {
          busTimelist3![i][0] = (recentArrived-2+i+1) - busTime3!.length;
          var tmpBus = busTime3![(recentArrived-2+i) - busTime3!.length];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (tmpBus - nowSum);
          } else {
            tmpTime = (1440-nowSum + tmpBus);
          }
          busTimelist3![i][1] = tmpTime;
        } else {
          busTimelist3![i][0] = recentArrived-2+i+1;
          var tmpBus = busTime3![(recentArrived-2+i)];
          num tmpTime = 0;
          tmpTime = (tmpBus - nowSum);
          busTimelist3![i][1] = tmpTime;
        }
      }
      setState(() {
        titleSecond = (59 - now.second).toString();
      });
    }
    _setBustime4() {
      DateTime now = DateTime.now();
      // DateTime now = DateTime.utc(2023, 2, 28, 8, 30, 00);
      var nowSum = ((now.hour * 60) + now.minute);
      var recentArrived = 0;
      // print(nowSum);
      for (int i=0;i<busTime4!.length;i++) {
        if(busTime4![i] >= nowSum) {
          recentArrived = i;
          break;
        }
      }
      for (int i=0;i<4;i++) {
        if (recentArrived-2+i+1 < 1) {
          busTimelist4![i][0] = busTime4!.length + (recentArrived-2+i+1);
          var tmpBus = busTime4![busTime4!.length + (recentArrived-2+i)];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (1440 - tmpBus + nowSum) * -1;
          } else {
            tmpTime = (nowSum - tmpBus) * -1;
          }
          busTimelist4![i][1] = tmpTime;
        } else if (recentArrived-2+i+1 > busTime4!.length) {
          busTimelist4![i][0] = (recentArrived-2+i+1) - busTime4!.length;
          var tmpBus = busTime4![(recentArrived-2+i) - busTime4!.length];
          num tmpTime = 0;
          if (tmpBus > nowSum) {
            tmpTime = (tmpBus - nowSum);
          } else {
            tmpTime = (1440-nowSum + tmpBus);
          }
          busTimelist4![i][1] = tmpTime;
        } else {
          busTimelist4![i][0] = recentArrived-2+i+1;
          var tmpBus = busTime4![(recentArrived-2+i)];
          num tmpTime = 0;
          tmpTime = (tmpBus - nowSum);
          busTimelist4![i][1] = tmpTime;
        }
      }
      setState(() {
        titleSecond = (59 - now.second).toString();
      });
    }


    _setBustime0();
    _setBustime1();
    _setBustime2();
    _setBustime3();
    _setBustime4();

    _timer = Timer.periodic(Duration(milliseconds:1000), (timer) async {
      _setBustime0();
      _setBustime1();
      _setBustime2();
      _setBustime3();
      _setBustime4();

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
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
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
                                height: 80,
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
                                          "${busTimelist0![0][0]}회차    ${busTimelist0![0][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist0![1][0]}회차    ${busTimelist0![1][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "${busTimelist0![2][0]}회차    ${busTimelist0![2][1]==0 ? "잠시후" : "${busTimelist0![2][1]}분"}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist0![3][0]}회차    ${busTimelist0![3][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
                                height: 55,
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                color: const Color.fromRGBO(238, 194, 82, 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "외성생활관",
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
                                height: 80,
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
                                          "${busTimelist1![0][0]}회차    ${busTimelist1![0][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist1![1][0]}회차    ${busTimelist1![1][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "${busTimelist1![2][0]}회차    ${busTimelist1![2][1]==0 ? "잠시후" : "${busTimelist1![2][1]}분"}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist1![3][0]}회차    ${busTimelist1![3][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
                                height: 55,
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                color: const Color.fromRGBO(113, 111, 233, 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "범어사역",
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
                                height: 80,
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
                                          "${busTimelist2![0][0]}회차    ${busTimelist2![0][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist2![1][0]}회차    ${busTimelist2![1][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "${busTimelist2![2][0]}회차    ${busTimelist2![2][1]==0 ? "잠시후" : "${busTimelist2![2][1]}분"}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist2![3][0]}회차    ${busTimelist2![3][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
                                height: 55,
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                color: const Color.fromRGBO(238, 194, 82, 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "남산역",
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
                                height: 80,
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
                                          "${busTimelist3![0][0]}회차    ${busTimelist3![0][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist3![1][0]}회차    ${busTimelist3![1][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "${busTimelist3![2][0]}회차    ${busTimelist3![2][1]==0 ? "잠시후" : "${busTimelist3![2][1]}분"}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist3![3][0]}회차    ${busTimelist3![3][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
                                height: 55,
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                color: const Color.fromRGBO(113, 111, 233, 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "금산빌라",
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
                                height: 80,
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
                                          "${busTimelist4![0][0]}회차    ${busTimelist4![0][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist4![1][0]}회차    ${busTimelist4![1][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "${busTimelist4![2][0]}회차    ${busTimelist4![2][1]==0 ? "잠시후" : "${busTimelist4![2][1]}분"}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "${busTimelist4![3][0]}회차    ${busTimelist4![3][1]}분",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
