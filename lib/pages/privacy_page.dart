import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  String privacySummary = "";
  String privacy = "";
  bool? _isAgree = false;

  _getData() async {
    var tmpprivacySummary =
        await rootBundle.loadString('assets/texts/privacy_summary.txt');
    var tmpprivacy = await rootBundle.loadString('assets/texts/privacy.txt');
    setState(()  {
      privacySummary = tmpprivacySummary;
      privacy = tmpprivacy;
    });
  }

  _nextPage() async {
    if (_isAgree == false) {
      _showDialog();
    } else {
      await storage.write(key: "privacy", value: "true");
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    }
  }

  _showDialog() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        title: const Center(
          child: Text('동의 여부을 확인해주세요.'),
        ),
        // content: Text('아직 개발 중 입니다!'),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
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
          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    '개인정보 처리방침',
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
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              color: const Color.fromRGBO(113, 111, 233, 1),
                              child: Center(
                                child: Text(
                                  privacySummary,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
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
                            Expanded(
                              child: Container(
                                // height: 200,
                                padding: EdgeInsets.all(15),
                                color: Colors.white,
                                child: Center(
                                    child: SingleChildScrollView(
                                  physics: const ClampingScrollPhysics(),
                                  child: Text(
                                    privacy,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Checkbox(
                              value: _isAgree,
                              // checkColor: const Color.fromRGBO(113, 111, 233, 1),
                              activeColor:
                                  const Color.fromRGBO(113, 111, 233, 1),
                              side: const BorderSide(
                                color: Color.fromRGBO(113, 111, 233, 1),
                                width: 2,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _isAgree = value;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            const Text(
                              '동의',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => {_nextPage()},
                          style: TextButton.styleFrom(
                              foregroundColor: Color.fromRGBO(113, 111, 233, 1),
                              backgroundColor: Color.fromRGBO(113, 111, 233, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0))),
                          child: const Text(
                            '다음',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
