import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://m.bufs.ac.kr/")),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage);
        },
  //       onLoadStop: (controller, url) async {
  //         await controller.evaluateJavascript(source: """
  //   const args = [1, true, ['bar', 5], {foo: 'baz'}];
  //   window.flutter_inappwebview.callHandler('myHandlerName', ...args);
  // """);// 2
  //       },
      ),
    );
  }
}
