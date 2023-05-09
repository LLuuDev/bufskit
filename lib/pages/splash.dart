import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
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
      initTask();
    });
  }

  void initTask() {
    List taskList = [];
    if (ModalRoute.of(context)!.settings.arguments == null) {
      taskList = ["Task1"];
    } else {
      taskList = ModalRoute.of(context)!.settings.arguments as List;
    }


    if (taskList.contains("Task1")) {
      print("Task1");
      getApiVersion();
    }
    if (taskList.contains("Task2")) {
      print("Task2");
    }
    print(taskList);
    // Navigator.pushNamed(context, '/',arguments : ['Task1', "Task2"]);
  }

  void getApiVersion() async {
    Map versionData;
    String? cafeteriaMenu;
    String? busSchedule;

    final url = Uri.parse('https://raw.githubusercontent.com/LLuuDev/bufskit/master/assets/api/v1.json');
    var response = await http.get(url);
    String responseBody = utf8.decode(response.bodyBytes);
    versionData = jsonDecode(responseBody)["version"];
    print(await storage.read(key: "cafeteriaMenu"));
    print(await storage.read(key: "busSchedule"));
    print(await storage.read(key: "userInfo"));
    print(await storage.read(key: "midtermExam"));
    print(await storage.read(key: "finalExam"));
    print(await storage.read(key: "secureStorage"));
    versionData.forEach((key, value) async {
      if(value != await storage.read(key: key)) {
        print(key);
        await storage.write(
            key: key,
            value: versionData[key]
        );
        if (key != "secureStorage") {
          final jsUrl = Uri.parse('https://raw.githubusercontent.com/LLuuDev/bufskit/master/assets/api/$key.js');
          var jsResponse = await http.get(jsUrl);
          String jsResponseBody = utf8.decode(jsResponse.bodyBytes);
          // print(jsResponseBody);
        } else {
          await storage.deleteAll();
        }

      }
    });
    // await storage.deleteAll();
  }

  static const storage = FlutterSecureStorage();
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
  CookieManager cookieManager = CookieManager.instance();

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
              await controller.loadData(data: "");
            },
            onConsoleMessage: (controller, consoleMessage) {
              // print(consoleMessage);
            },
            onLoadStop: (controller, url) async {
              // print("1");
              // if (userId != null && _tryLogin == false) {
              //   isLogin(controller);
              // }
              // if (_tryLogin == true && _checkLogin == false) {
              //   checkLogin(controller);
              // }
              // if (_checkLogin == true && _checkData == false) {
              //   checkData(controller);
              // }
              // if (_checkData == true && _busSchedule == false) {
              //   busSchedule(controller);
              // }
              // if (_checkData == true && _foodSchedule == false) {
              //   foodSchedule(controller);
              // }
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 64,
                    width: 64,
                    child: Center(
                      child: Text(
                        'B',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 64,
                    width: 64,
                    child: Center(
                      child: Text(
                        'U',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    height: 64,
                    width: 64,
                    child: Center(
                      child: Text(
                        'F',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 64,
                    width: 64,
                    child: Center(
                      child: Text(
                        'S',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
