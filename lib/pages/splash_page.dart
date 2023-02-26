import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }
  String? userId = ""; //user의 정보를 저장하기 위한 변수
  String? userPw = ""; //user의 정보를 저장하기 위한 변수
  String? autoLogin = ""; //user의 정보를 저장하기 위한 변수
  String? manualLogin = ""; //user의 정보를 저장하기 위한 변수
  String? fastLogin = "false"; //나중에 성적 새로고침 할때 false 로 바꿔주기
  String? failLogin = ""; //user의 정보를 저장하기 위한 변수
  static const storage = FlutterSecureStorage();
  CookieManager cookieManager = CookieManager.instance();
  bool? _tryLogin = false;
  bool? _checkLogin = false;
  bool? _checkData = false;
  bool? _busSchedule = false;
  bool? _foodSchedule = false;
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
  _asyncMethod() async {
    userId = await storage.read(key: 'userId');
    userPw = await storage.read(key: 'userPw');
    autoLogin = await storage.read(key: 'autoLogin');
    manualLogin = await storage.read(key: 'manualLogin');
    if (manualLogin == "true") {
      await storage.write(
          key: "manualLogin",
          value: "false");
      // Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false,);
    } else {
      if (autoLogin == "true") {
      } else {
        await storage.delete(key: "userId");
        await storage.delete(key: "userPw");
        await storage.delete(key: "autoLogin");
        await storage.delete(key: "manualLogin");
        await storage.delete(key: "fastLogin");
        await storage.delete(key: "userInfo");
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false,);

      }
      // Navigator.pushReplacementNamed(context, '/login');
    }
  }

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));



  void isLogin(controller) async {
    setState(() {
      _tryLogin = true;
    });
    await controller.evaluateJavascript(
        source: 'document.getElementById("txtUserID").value = "$userId";');
    await controller.evaluateJavascript(
        source: 'document.getElementById("txtPasswd").value = "$userPw";');
    await controller.evaluateJavascript(
        source: 'document.getElementById("btnLogin").click();');

    // print(await controller.evaluateJavascript(source: 'loginStatus'));
  } // 로그인

  void checkLogin(controller) async {
    sleep(const Duration(milliseconds:500));
    await controller.evaluateJavascript(source: """
      try {
          logout = document.getElementsByClassName("logout")[0].innerText
          loginStatus = true
      } catch (e) {
          loginStatus = false
      }
      """);
    if ((await controller.evaluateJavascript(source: 'loginStatus')) == true) {
      setState(() {
        _checkLogin = true;
      });
      await controller.loadUrl(
          urlRequest: URLRequest(
              url: Uri.parse(
                  "https://m.bufs.ac.kr/SAHJ/A/SAHJA0010S.aspx?mc=0947")));
      // Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false,);
    }
    sleep(const Duration(milliseconds:500));
    if ((await controller.evaluateJavascript(source: 'loginStatus')) == false) {
      await storage.write(
          key: "failLogin",
          value: "true");
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false,);
    }
  }
  void checkData(controller) async {
    // sleep(const Duration(seconds:1));
    await controller.evaluateJavascript(source: """
      const getUserinfo = () => {
    userInfo.koreanName = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.englishName = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[1]/div[3]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.studentNumber = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[1]/div[1]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.college = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[3]/div[1]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.department = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[3]/div[2]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.grade = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[2]/div[4]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.gender = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[2]/div[2]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
};
const getUserclass = async () => {
    const classSemestertbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[6]/div/div/div[1]/div/div[2]/div/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //학기별 위치

    const classSubjecttbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[6]/div/div/div[2]/div/div[2]/div/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //과목별 위치
    //학기 갯수 만큼 반복
    userInfo.class = {};
    weekDate = ['월','화','수','목','금']
    for (let i = 0; i < classSemestertbody().getElementsByTagName("tr").length - 1; i++) {
        //학기정보 저장 최근 학기부터
        let classSemester = classSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0].innerText;
        //학기조회 버튼 클릭
        classSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0]
            .getElementsByTagName("a")[0]
            .click();

        //학기별 정보 로딩 대기
        await new Promise((r) => {
            let ids = setInterval(() => {
                //조회한 학기 값
                tmp = classSemestertbody()
                    .getElementsByClassName("bg-warning")[0]
                    .getElementsByTagName("td")[0].innerText;
                //클릭한 학기값과 조회한 학기 값이 같다면
                if (tmp === classSemester) {
                    semesterInfo = tmp.replace(/(\\t|\\n)/g, "");
                    userInfo.class[semesterInfo] = [[],[],[],[],[]];
                    //과목 갯수만큼 반복
                    for (let j = 0; j < classSubjecttbody().getElementsByTagName("tr").length - 1; j++) {
                        subjectInfo = classSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[1].innerText;
                        // userInfo.class[semesterInfo][subjectInfo] = {};
                        //
                        // let classrooms = {};
                        strcc = classSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[6].innerText;

                        if (strcc.length > 1) {
                            tmpcc = strcc.split("(");
                            classroomcc = tmpcc[0].split(",");
                            schedulecc = tmpcc[1].slice(0, -1).split(",");

                            if (classroomcc.length === 1) {
                                datestmpcc = "월";
                                datetmpcc = "1";
                                classtmpcc = classroomcc[0];
                                for (let p = 0; p < schedulecc.length; p++) {
                                    if (isNaN(parseInt(schedulecc[p]))) {
                                        datestmpcc = weekDate.indexOf(schedulecc[p][0])
                                        datetmpcc = schedulecc[p].slice(1);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc] = []
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(subjectInfo);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(1);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classtmpcc);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classSubjecttbody()
                                            .getElementsByTagName("tr")
                                            [j + 1].getElementsByTagName("td")[7].innerText)

                                    } else {
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc][1] += 1;

                                    }
                                }
                            } else {
                                datestmpcc = "월";
                                datetmpcc = "1";
                                classtmpcc = classroomcc[0];
                                classtmpcountcc = 0;
                                for (let p = 0; p < schedulecc.length; p++) {
                                    if (isNaN(parseInt(schedulecc[p]))) {
                                        datestmpcc = weekDate.indexOf(schedulecc[p][0])
                                        datetmpcc = schedulecc[p].slice(1);
                                        classtmpcc = classroomcc[classtmpcountcc];
                                        classtmpcountcc += 1;
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc] = []
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(subjectInfo);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(1);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classtmpcc);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classSubjecttbody()
                                            .getElementsByTagName("tr")
                                            [j + 1].getElementsByTagName("td")[7].innerText)
                                    } else {
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc][1] += 1;

                                    }
                                }
                            }
                        }
                    }
                    //현재 인터벌 초기화
                    clearInterval(ids);
                    r();
                }
            }, 1000);
        });
    }
};
const getUserscore = async () => {
    const scoreSemestertbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[7]/div[2]/div/div[1]/div/div[2]/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //학기별 위치

    const scoreSubjecttbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[7]/div[2]/div/div[2]/div/div[2]/div/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //과목별 위치
    //학기 갯수 만큼 반복
    userInfo.score = {};
    for (let i = 0; i < scoreSemestertbody().getElementsByTagName("tr").length - 1; i++) {
        //학기정보 저장 최근 학기부터
        let scoreSemester = scoreSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0].innerText;
        //학기조회 버튼 클릭
        scoreSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0]
            .getElementsByTagName("a")[0]
            .click();

        //학기별 정보 로딩 대기
        await new Promise((r) => {
            let id = setInterval(() => {
                //조회한 학기 값
                tmp = scoreSemestertbody()
                    .getElementsByClassName("bg-warning")[0]
                    .getElementsByTagName("td")[0].innerText;
                //클릭한 학기값과 조회한 학기 값이 같다면
                if (tmp === scoreSemester) {
                    semesterInfo = tmp.replace(/(\\t|\\n)/g, "");
                    userInfo.score[semesterInfo] = {};
                    userInfo.score[semesterInfo].creditSign = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[1].innerText;
                    userInfo.score[semesterInfo].credit = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[2].innerText;
                    userInfo.score[semesterInfo].creditAvg = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[4].innerText;
                    userInfo.score[semesterInfo].rank = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[6].innerText;

                    userInfo.score[semesterInfo].subjectScore = {};
                    //과목 갯수만큼 반복
                    for (let j = 0; j < scoreSubjecttbody().getElementsByTagName("tr").length - 1; j++) {
                        subjectInfo = scoreSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[1].innerText;
                        userInfo.score[semesterInfo].subjectScore[subjectInfo] = {};
                        userInfo.score[semesterInfo].subjectScore[subjectInfo].credit = scoreSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[5].innerText;
                        userInfo.score[semesterInfo].subjectScore[subjectInfo].gradeSymbol = scoreSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[6].innerText;
                    }
                    //현재 인터벌 초기화
                    clearInterval(id);
                    r();
                }
            }, 1000);
        });
    }
};
let userInfo = {};
dataStatus = false
const getData = async () => {
    await getUserinfo();
    await getUserclass();
    await getUserscore();
    userInfo = JSON.stringify(userInfo);
    dataStatus = true
};
getData();

      """);
    _timer1 = Timer.periodic(Duration(milliseconds:100), (timer) async {
      // print((await controller.evaluateJavascript(source: 'userInfo')));
      if ((await controller.evaluateJavascript(source: 'dataStatus')) == true) {
        await storage.write(
            key: "userInfo",
            value: (await controller.evaluateJavascript(source: 'userInfo')).toString());
        setState(() {
        _checkData = true;
        });
        _timer1.cancel();
        await controller.loadUrl(
            urlRequest: URLRequest(
                url: Uri.parse(
                    "https://www.bufs.ac.kr/bbs/board.php?bo_table=camp_guide&sca=%EC%85%94%ED%8B%80%EB%B2%84%EC%8A%A4%EC%95%88%EB%82%B4")));
      }
    });
  }

  void busSchedule(controller) async {
    await controller.evaluateJavascript(source: """
datas = document.getElementsByClassName("table_01")[0].getElementsByTagName("span");
const getBusSchedule = async () => {
    for (let j = 0; j < datas.length; j++) {
        tmp = datas[j].innerText.split(":");
        mins = (parseInt(tmp[0]) * 60) + parseInt(tmp[1]);
        busSchedule.push(mins);
    }
}

busSchedule = []
busStatus = false

const getDatas = async () => {
    await getBusSchedule();
    busSchedule = JSON.stringify(busSchedule);
    busStatus = true;
};
getDatas();

      """);

    _timer2 = Timer.periodic(Duration(milliseconds:100), (timer) async {
      // print((await controller.evaluateJavascript(source: 'document')));
      if ((await controller.evaluateJavascript(source: 'busStatus')) == true) {
        await storage.write(
            key: "busSchedule",
            value: (await controller.evaluateJavascript(source: 'busSchedule')).toString());
        setState(() {
          _busSchedule = true;
        });
        _timer2.cancel();
        await controller.loadUrl(
            urlRequest: URLRequest(
                url: Uri.parse(
                    "https://www.bufs.ac.kr/bbs/board.php?bo_table=weekly_meal&wr_id=1")));
      }
    });
  }
  void foodSchedule(controller) async {
    await controller.evaluateJavascript(source: """
date = ['monday','tuesday','wednesday','thursday','friday']
const getFoodSchedule = async () => {
    for (let i = 0; i<5; i++) {
        foodSchedule[date[i]] = {}
        corner1list = []
        corner1list.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[3].innerText.replace("\\n","").trim())
        corner1list.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[4].innerText.replace("\\n","").trim())
        corner1list.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[5].innerText.replace("\\n","").trim())
        foodSchedule[date[i]].corner1 = corner1list
        foodSchedule[date[i]].corner2 = document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[7].innerText.replace("\\n","").trim()
        corner3list = []
        corner3list.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[9].innerText.replace("\\n","").trim())
        corner3list.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[10].innerText.replace("\\n","").trim())
        corner3list.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[11].innerText.replace("\\n","").trim())
        foodSchedule[date[i]].corner3 = corner3list
        commonlist = document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[13].innerText.replace("\\n","").trim().split(",");
        foodSchedule[date[i]].common = commonlist
        foodSchedule[date[i]].corner4 = document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[15].innerText.replace("\\n","").trim()
        snackList = document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[17].innerText.replace("\\n","").trim().split(",");
        foodSchedule[date[i]].snack = snackList
    }
}
foodSchedule = {}

foodStatus = false
const getDatass = async () => {
    await getFoodSchedule();
    foodSchedule = JSON.stringify(foodSchedule)
    foodStatus = true;
};
getDatass();
      """);

    _timer3 = Timer.periodic(Duration(milliseconds:100), (timer) async {
      // print((await controller.evaluateJavascript(source: 'foodStatus')));
      if ((await controller.evaluateJavascript(source: 'foodStatus')) == true) {
        await storage.write(
            key: "foodSchedule",
            value: (await controller.evaluateJavascript(source: 'foodSchedule')).toString());
        setState(() {
          _foodSchedule = true;
        });
        _timer3.cancel();
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false,);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // height: 1,
            // width: 1,
            child: InAppWebView(
              onWebViewCreated: (controller) async {
                webViewController = controller;
                await cookieManager.deleteAllCookies();
                await controller.loadData(data:"");
                fastLogin = await storage.read(key: 'fastLogin');
                if (fastLogin == "true") {
                  setState(() {
                    _tryLogin = true;
                    _checkLogin = true;
                    _checkData = true;
                  });
                  await controller.loadUrl(
                      urlRequest: URLRequest(
                          url: Uri.parse(
                              "https://www.bufs.ac.kr/bbs/board.php?bo_table=camp_guide&sca=%EC%85%94%ED%8B%80%EB%B2%84%EC%8A%A4%EC%95%88%EB%82%B4")));
                  // busSchedule(controller);
                } else {
                  await controller.loadUrl(
                      urlRequest: URLRequest(
                          url: Uri.parse(
                              "https://m.bufs.ac.kr/")));
                }
              },
              onConsoleMessage: (controller, consoleMessage) {
                // print(consoleMessage);
              },
              onLoadStop: (controller, url) async {

                // print("1");
                if (userId != null && _tryLogin == false) {
                  isLogin(controller);
                }
                if (_tryLogin == true && _checkLogin == false) {
                  checkLogin(controller);
                }
                if (_checkLogin == true && _checkData == false) {
                  checkData(controller);
                }
                if (_checkData == true && _busSchedule == false) {
                  busSchedule(controller);
                }
                if (_busSchedule == true && _foodSchedule == false) {
                  foodSchedule(controller);
                }
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(113, 111, 233, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'BUFS',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
