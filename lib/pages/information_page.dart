import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yaml/yaml.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  String appVersion = "";

  _getData() async {
    var tmpappVersion = '';
    await rootBundle.loadString('pubspec.yaml').then((yamlValue) {
      var yaml = loadYaml(yamlValue);
      tmpappVersion = yaml['version'];
    });
    setState(()  {
      appVersion = tmpappVersion;
    });
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
                        '앱 정보',
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
                          width: 100,
                          height: 55,
                          color: const Color.fromRGBO(113, 111, 233, 1),
                          child: const Center(
                            child: Text(
                              "앱 버전",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              height: 55,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  appVersion,
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
                  const SizedBox(
                    height: 15,
                  ),
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
                          width: 100,
                          height: 55,
                          color: const Color.fromRGBO(113, 111, 233, 1),
                          child: const Center(
                            child: Text(
                              "개발자",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              height: 55,
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  "전무강",
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
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 55,
                        color: const Color.fromRGBO(228, 117, 102, 1),
                        child: const Center(
                          child: Text(
                            '로그아웃',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 0,
                        left: 0,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              // await storage.delete(key: "userId");
                              // await storage.delete(key: "userPw");
                              // await storage.delete(key: "autoLogin");
                              // await storage.delete(key: "manualLogin");
                              // await storage.delete(key: "fastLogin");
                              // await storage.delete(key: "userInfo");
                              await storage.deleteAll();
                              await storage.write(key: "privacy", value: "true");
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/splash',
                                    (route) => false,
                              );
                            },
                          ),
                        ),
                      ),
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
