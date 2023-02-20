import 'package:flutter/material.dart';
import 'package:bufskit/components/main_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? userId = ""; //user의 정보를 저장하기 위한 변수
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userId = await storage.read(key: 'userId');
    if (userId != null) {
      Navigator.pushNamed(context, '/login');
    } else {
      Navigator.pushNamed(context, '/login');
      // Navigator.pushReplacementNamed(context, '/login');
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
              padding: const EdgeInsets.all(15),
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
                        _showDialog();
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/announcement.svg', '학사공지', () {
                        _showDialog();
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
                        _showDialog();
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
                        _showDialog();
                        storage.delete(key: "userId");
                        storage.delete(key: "userPw");
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
