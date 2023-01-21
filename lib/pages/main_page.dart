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

  static const storage = FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  @override
  void initState() {
    super.initState();
    //비동기로 flutter secure storage 정보를 불러오는 작업.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    userId = await storage.read(key:'userId');
    // print(userId);

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (userId != null) {

    } else {
      // Navigator.pushNamed(context, '/login');
    }
  }

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
                        storage.delete(key: "userId");
                        storage.delete(key: "userPwd");
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
