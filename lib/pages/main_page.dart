import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/announcement.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '일반공지',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/announcement.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '학사공지',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/schedule.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '시간표',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/student.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '학생증',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/bus.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '버스 시간표',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/food.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '오늘의 학식',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/grade.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '학기별 성적',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Stack(
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
                                      width: 55,
                                      height: 55,
                                      color: const Color.fromRGBO(113, 111, 233, 1),
                                      child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icons/infomation.svg',
                                          )),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text(
                                              '앱 정보',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ],
                          )),
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
