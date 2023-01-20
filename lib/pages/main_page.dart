import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bufskit/components/main_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            //타이틀
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
                        Navigator.pushNamed(context, '/login');
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/announcement.svg', '학사공지', () {
                        Navigator.pushNamed(context, '/login');
                      }),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButton('assets/icons/schedule.svg', '시간표', () {
                        Navigator.pushNamed(context, '/login');
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/student.svg', '학생증', () {
                        Navigator.pushNamed(context, '/login');
                      }),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButton('assets/icons/bus.svg', '버스 시간표', () {
                        Navigator.pushNamed(context, '/login');
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/food.svg', '오늘의 학식', () {
                        Navigator.pushNamed(context, '/login');
                      }),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButton('assets/icons/grade.svg', '학기별 성적', () {
                        Navigator.pushNamed(context, '/login');
                      }),
                      const SizedBox(
                        width: 15,
                      ),
                      MainButton('assets/icons/information.svg', '앱 정보', () {
                        Navigator.pushNamed(context, '/login');
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
