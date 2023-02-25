import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bufskit/components/main_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _getData();
  }
  _getData () async {
    var userInfo = await storage.read(key: 'userInfo');
    var busSchedule = await storage.read(key: 'busSchedule');
    var foodSchedule = await storage.read(key: 'foodSchedule');
    if (userInfo != null) {
      Map<String,dynamic> jsonData = jsonDecode(userInfo);
      // print(jsonData);
    }
    if (busSchedule != null) {
      List<dynamic> jsonDatas = jsonDecode(busSchedule);
      // print(jsonDatas);
    }
    if (foodSchedule != null) {
      Map<String,dynamic> jsonDatass = jsonDecode(foodSchedule);
      // print(jsonDatass);
    }
  }

  _showDialog () {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        title: const Center(
          child: Text('준비중'),
        ),
        // content: Text('아직 개발 중 입니다!'),
        actions: [
          Center(
            child: TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: Color.fromRGBO(113, 111, 233, 1),
              ),
                child: const Text(
                  '확인',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(113, 111, 233, 1),
                  ),
                ),
            ),
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );

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
                    '어서오세요!',
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
                  Row(
                    children: const [
                      Text(
                        '무엇이 필요하신가요?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButton('assets/icons/announcement.svg', '일반공지', () {
                        Navigator.pushNamed(context, '/uninotice');
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/announcement.svg', '학사공지', () {
                        Navigator.pushNamed(context, '/acanotice');
                      }),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButton('assets/icons/bus.svg', '버스 시간표', () {
                        _showDialog();
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/food.svg', '오늘의 학식', () {
                        _showDialog();
                      }),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButton('assets/icons/schedule.svg', '시간표', () {
                        Navigator.pushNamed(context, '/schedule');
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/student.svg', '학생증', () {
                        _showDialog();
                      }),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButton('assets/icons/grade.svg', '학기별 성적', () {
                        _showDialog();
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/information.svg', '앱 정보', () {
                        Navigator.pushNamed(context, '/information');
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
