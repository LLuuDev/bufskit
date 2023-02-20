import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  static const storage = FlutterSecureStorage();
  bool? _isAutoLogin = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      '로그인',
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
                child: AutofillGroup(
                 child: Column(
                   children: [
                     Container(
                       height: 55,
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
                       child: Center(
                         child: TextFormField(
                           controller: _idController,
                           keyboardType: TextInputType.number,
                           autofillHints: const [AutofillHints.username],
                           cursorColor: const Color.fromRGBO(113, 111, 233, 1),
                           decoration: const InputDecoration(
                               border: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               contentPadding:
                               EdgeInsets.only(left: 15, right: 15),
                               hintText: '학생포털시스템 아이디 (학번)',
                               hintStyle: TextStyle(fontSize: 16.0, color: Colors.black54)),
                         ),
                       ),
                     ),
                     const SizedBox(
                       height: 15,
                     ),
                     Container(
                       height: 55,
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
                       child: Center(
                         child: TextFormField(
                           controller: _pwController,
                           obscureText: true,
                           autofillHints: const [AutofillHints.password],
                           cursorColor: const Color.fromRGBO(113, 111, 233, 1),
                           decoration: const InputDecoration(
                               border: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               contentPadding:
                               EdgeInsets.only(left: 15, right: 15),
                               hintText: '학생포털시스템 비밀번호',
                               hintStyle: TextStyle(fontSize: 16.0, color: Colors.black54)),
                         ),
                       ),
                     ),
                     const SizedBox(
                       height: 15,
                     ),
                     Stack(
                       children: [
                         Container(
                           height: 55,
                           color: const Color.fromRGBO(113, 111, 233, 1),
                           child: const Center(
                             child: Text(
                               '로그인',
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
                                 await storage.write(
                                     key: "userId",
                                     value: _idController.text.toString());
                                 await storage.write(
                                     key: "userPw",
                                     value: _pwController.text.toString());
                                 Navigator.pop(context);
                               },
                             ),
                           ),
                         ),
                       ],
                     ),
                     const SizedBox(
                       height: 15,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Row(
                           children: [
                             Checkbox(
                               value: _isAutoLogin,
                               // checkColor: const Color.fromRGBO(113, 111, 233, 1),
                               activeColor:
                               const Color.fromRGBO(113, 111, 233, 1),
                               side: const BorderSide(
                                 color: Color.fromRGBO(113, 111, 233, 1),
                                 width: 2,
                               ),
                               onChanged: (value) {
                                 setState(() {
                                   _isAutoLogin = value;
                                 });
                               },
                             ),
                             const Text('자동 로그인',
                               style: TextStyle(
                                 color: Colors.black,
                               ),),
                           ],
                         ),
                         const SizedBox(
                           width: 30,
                         ),
                         TextButton(
                             onPressed: () {
                               Navigator.pop(context);
                             },
                             style: TextButton.styleFrom(
                               foregroundColor: const Color.fromRGBO(113, 111, 233, 1),
                             ),
                             child: const Text(
                               '나중에 로그인',
                               style: TextStyle(
                                 color: Color.fromRGBO(113, 111, 233, 1),
                               ),
                             )),
                       ],
                     )
                   ],
                 ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
