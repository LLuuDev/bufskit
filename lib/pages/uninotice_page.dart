import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class UninoticePage extends StatefulWidget {
  const UninoticePage({Key? key}) : super(key: key);

  @override
  State<UninoticePage> createState() => _UninoticePageState();
}

class _UninoticePageState extends State<UninoticePage> {
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
                    '일반공지',
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
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("https://www.bufs.ac.kr/bbs/board.php?bo_table=notice_uni")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
