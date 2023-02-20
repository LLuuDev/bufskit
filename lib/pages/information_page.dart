import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  InAppWebViewController? webViewController;
  CookieManager cookieManager = CookieManager.instance();
  bool? _tryLogin = false;
  bool? _checkLogin = false;

  final String _id = "";
  final String _pw = "";

  void isLogin(controller) async {
    setState(() {
      _tryLogin = true;
    });
    await controller.evaluateJavascript(
        source: 'document.getElementById("txtUserID").value = "$_id";');
    await controller.evaluateJavascript(
        source: 'document.getElementById("txtPasswd").value = "$_pw";');
    await controller.evaluateJavascript(
        source: 'document.getElementById("btnLogin").click();');

    print(await controller.evaluateJavascript(source: 'loginStatus'));
  } // 로그인

  void checkLogin(controller) async {
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
      await controller.loadUrl(urlRequest: URLRequest(url: Uri.parse("https://m.bufs.ac.kr/SAHJ/A/SAHJA0010S.aspx?mc=0947")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://m.bufs.ac.kr/")),
        onWebViewCreated: (controller) async{
          webViewController = controller;
          await cookieManager.deleteAllCookies();
        },
        onConsoleMessage: (controller, consoleMessage) {
          // print(consoleMessage);
        },
        onLoadStop: (controller, url) async {
          print("1");
          if (_tryLogin == false) {
            isLogin(controller);
          }
          if (_tryLogin == true && _checkLogin == false) {
            checkLogin(controller);
          }
        },
      ),
    );
  }
}
